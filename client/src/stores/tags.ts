import { Writable, writable, get } from 'svelte/store';
import { GET } from '../functions/request';
import type { TagType } from '../types';

interface TagsInterface {
  artists:    TagType[],
  titles:     TagType[],
  characters: TagType[],
  tags:       TagType[]
}
interface TagsStoreInterface extends Writable<TagsInterface> {
  all: () => Promise<TagsInterface>,
  empty: () => boolean,
  load: () => Promise<void>,
}

export const tags: TagsStoreInterface = {
  ...writable({}) as Writable<TagsInterface>,

  all: async function(): Promise<TagsInterface>{
    if (!this.empty) return get<TagsInterface>(this);

    await this.load();
    return get<TagsInterface>(this);
  },

  empty: function (): boolean {
    return Object.keys(get<TagsInterface>(this)).length > 0;
  },

  load: async function(): Promise<void>{
    const response = await GET({ path: '/api/tags' });
    this.set(response);
  },
}
