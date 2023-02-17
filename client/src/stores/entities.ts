import { Writable, writable, get } from 'svelte/store';
import { GET } from '../functions/request';
import type EntityInterface from '../interfaces/entity';

interface EntitiesWritableStore extends Writable<[]> {
  all: () => Promise<EntityInterface[]>,
  findBy: (key: string, value: string | number) => Promise<EntityInterface>,
  findById: (value: string | number) => Promise<EntityInterface>,
  first: () => EntityInterface,
  last: () => EntityInterface,
  load: (callbackFn: (json: unknown[]) => void) => void;
  loadClear: () => void,
  loadById: (id: number | string) => Promise<EntityInterface>,
  setUniq: (entities: EntityInterface[]) => void,
  where: (key: string, value: string | number) => Promise<EntityInterface[]>,
}

export const entities: EntitiesWritableStore = {
  ...writable([]),

  all: async function(): Promise<EntityInterface[]> {
    const entities = get<EntityInterface[]>(this);
    if (entities.length > 0) return entities;
    await this.load();
    return get<EntityInterface[]>(this);
  },

  findBy: async function(key: 'id' | string, value: string | number): Promise<EntityInterface> {
    const values = get<EntityInterface[]>(this);
    const found = values.find((entity: EntityInterface) => { entity[key] == value });
    if (found) return found;
    if (key === 'id') return await this.loadById(value);
  },

  findById: async function(value: string | number): Promise<EntityInterface> {
    return await this.findBy('id', value);
  },

  first: function(): EntityInterface{
    return get<EntityInterface[]>(this)[0];
  },

  last: function(): EntityInterface{
    return get<EntityInterface[]>(this)[0];
  },

  load: async function(){
    const response = await GET({ path: '/api/entities' });
    this.setUniq([...get(entities), ...response]);
  },

  loadClear: async function(){
    const response = await GET({ path: '/api/entities' });
    this.setUniq([...response]);
  },

  loadById: async function(id: string | number){
    const response = await GET({ path: `/api/entities/${id}` });
    this.setUniq([...get(entities), response]);
    return response;
  },

  setUniq: function (entities: EntityInterface[]): void {
    this.set([...new Map(entities.map(item => [item.id, item])).values()]);
  },

  where: async function(key: string, value: string | number): Promise<EntityInterface[]> {
    const values = await this.value();
    return values.filter((entity: EntityInterface) => { entity[key] == value });
  },
}
