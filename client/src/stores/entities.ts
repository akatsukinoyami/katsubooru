import { Writable, writable, get } from 'svelte/store';
import { GET } from '../functions/request';
import type EntityInterface from '../interfaces/entity';

type EntitiesObjectType = Record<number, EntityInterface>;

export interface EntitiesWritableStore extends Writable<EntitiesObjectType> {
  all: () => Promise<EntitiesObjectType>,
  array: () => EntityInterface[],
  count: () => number,
  empty: () => boolean,
  findBy: (key: string, value: string | number) => Promise<EntityInterface>,
  findById: (value: string | number) => Promise<EntityInterface>,
  first: () => EntityInterface,
  last: () => EntityInterface,
  load: (callbackFn: (json: unknown[]) => void) => void;
  loadClear: () => void,
  loadById: (id: number | string) => Promise<EntityInterface>,
  where: (key: string, value: string | number) => Promise<EntitiesObjectType>,
}

export const entities: EntitiesWritableStore = {
  ...writable({}),

  all: async function(): Promise<EntitiesObjectType> {
    if (!this.empty) return get<EntitiesObjectType>(this);

    await this.load();
    return get<EntitiesObjectType>(this);
  },

  array: function (): EntityInterface[] {
    return Object.values(get<EntitiesObjectType>(this));
  },

  count: function (): number {
    return Object.keys(get<EntitiesObjectType>(this)).length;
  },

  empty: function (): boolean {
    return this.count > 0;
  },

  findBy: async function(key: string, value: string | number): Promise<EntityInterface> {
    return this.array().find((entity: EntityInterface) => { entity[key] == value });
  },

  findById: async function(value: string | number): Promise<EntityInterface> {
    return get<EntitiesObjectType>(this)[value];
  },

  first: function(): EntityInterface{
    return this.array()[0];
  },

  last: function(): EntityInterface{
    return this.array()[this.count - 1];
  },

  load: async function(){
    const response = await GET({ path: '/api/entities' }) as EntitiesObjectType;
    this.set({...get(entities), ...response});
  },

  loadById: async function(id: string | number){
    const response = await GET({ path: `/api/entities/${id}` }) as EntityInterface;
    this.set({...get(entities), response});
    return response;
  },

  loadClear: async function(){
    const response = await GET({ path: '/api/entities' }) as EntitiesObjectType;
    this.set({...response});
  },

  where: async function(key: string, value: string | number): Promise<EntitiesObjectType> {
    return this.array().filter((entity: EntityInterface) => { entity[key] == value });
  },
}
