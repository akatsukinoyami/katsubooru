import { get, derived, Readable } from 'svelte/store';
import { GET } from '../functions/request';
import type EntityInterface from '../interfaces/entity';
import { currentUser } from './currentUser';

interface EntitiesDerivedStore extends Readable<EntityInterface[]> {
  find: (key: string, value: string | number) => EntityInterface,
  value: () => EntityInterface[],
  where: (key: string, value: string | number) => EntityInterface[],
}

export const entities: EntitiesDerivedStore = {
  ...derived(
    currentUser,
    ($currentUser, set) => {
      GET({
        path: '/api/entities',
        callbackFn: (json) => { set([...get(entities), ...json]) }
      });
      //return () => { set = () => {} }; // see big comment
    }, [],
  ),

  find: function(key: string, value: string | number): EntityInterface {
    return this.value()
      .find((entity: EntityInterface) => {
      entity[key] == value
    });
  },

  value: function(): EntityInterface[] {
    return get<EntityInterface[]>(this);
  },

  where: function(key: string, value: string | number): EntityInterface[] {
    return this.value()
      .filter((entity: EntityInterface) => {
      entity[key] == value
    });
  },
}

// We override the `set` function to eliminate race conditions
// This does *not* abort running fetch() requests, it only prevents
// them from overriding the store.
// To learn about canceling fetch requests, search the internet for `AbortController`
