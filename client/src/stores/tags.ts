import { Writable, writable, get } from 'svelte/store';
import { GET } from '../functions/request';
import type { TagsType, TagType } from '../types';

interface TagsStoreInterface extends Writable<TagsType> {
  all: () => TagsType,
  empty: () => boolean,
  load: () => Promise<void>,
  [key: string]: TagType | any,
}

interface TagsIndexApiResponseInterface {
  tags: Record<string, string>,
  types: Record<string, string>,
}

export const tags: TagsStoreInterface = {
  ...writable({}) as Writable<TagsType>,

  all(): TagsType {
    return get<TagsType>(this);
  },

  findById(id: string | number): TagType {
    const { tags } = get<TagsType>(this);
    id = id.toString();
    return tags[id];
  },

  empty(): boolean {
    return Object.keys(get<TagsType>(this)).length > 0;
  },

  async load(): Promise<void>{
    const { tags, types } = await GET({ path: '/api/tags' }) as TagsType;
    this.tags = tags;
    this.types = types;

    this.set({ tags, types });
  },
}
