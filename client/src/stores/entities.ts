import { Writable, writable, get } from 'svelte/store';
import { GET } from '../functions/request';
import type { EntityInterface } from '../interfaces';
import type { EntitiesObjectType, TagsType } from '../types';

export interface EntitiesWritableStore extends Writable<EntitiesObjectType> {
  all: () => EntitiesObjectType,
  count: () => number,
  empty: () => boolean,
  findBy: (key: string, value: string | number) => EntityInterface,
  findById: (value: string | number) => EntityInterface,
  first: () => EntityInterface,
  keys: () => string[] | number[],
  last: () => EntityInterface,
  load: () => Promise<void>;
  loadClear: () => Promise<void>,
  loadById: (id: number | string) => Promise<EntityInterface>,
  tags: () => Record<string, number[]>,
  values: () => EntityInterface[],
  where: (key: string, value: string | number) => EntitiesObjectType,
}

export const entities: EntitiesWritableStore = {
  ...writable({}),

  all(): EntitiesObjectType {
    return get<EntitiesObjectType>(this);
  },

  count(): number {
    return this.keys().length;
  },

  empty(): boolean {
    return this.count === 0;
  },

  findBy(key: string, value: string | number): EntityInterface {
    return this.values().find((entity: EntityInterface) => { entity[key] == value });
  },

  findById(value: string | number): EntityInterface {
    return get<EntitiesObjectType>(this)[value];
  },

  first(): EntityInterface{
    return this.values()[0];
  },

  keys(): string[] | number[] {
    return Object.keys(get<EntitiesObjectType>(this));
  },

  last(): EntityInterface{
    return this.values()[this.count - 1];
  },

  async load(): Promise<void>{
    const response = await GET({ path: '/api/entities' }) as EntitiesObjectType;
    this.set({...get(entities), ...response});
  },

  async loadById(id: string | number): Promise<EntityInterface>{
    const response = await GET({ path: `/api/entities/${id}` }) as EntityInterface;
    this.set({...get(entities), response});
    return response;
  },

  async loadClear(): Promise<void>{
    const response = await GET({ path: '/api/entities' }) as EntitiesObjectType;
    this.set({...response});
  },

  tags(): TagsType{
    const allTags: TagsType = {};

    this.values().forEach((entity: EntityInterface) => {
      const entityTags = entity.tags;

      Object.keys(entityTags).forEach(tagType => {
        const tags = entityTags[tagType];

        if (allTags[tagType]) {
          allTags[tagType].push(...tags.filter(tag => !allTags[tagType].includes(tag)));
        } else {
          allTags[tagType] = tags;
        }
      });
    });

    return allTags;
  },

  values(): EntityInterface[] {
    return Object.values(get<EntitiesObjectType>(this));
  },

  where(key: string, value: string | number): EntitiesObjectType {
    return this
      .values()
      .filter((entity: EntityInterface) => { entity[key] === value });
  },
}
