import type { TagInterface } from ".";

export default interface EntityInterface {
  id: number,
  file: File,
  file_hash: string,
  link: string,
  media_type: string,
  rating: string,
  origin: string,
  user_id: number,
  artist_id: number,
  collection_id: number,
  artist: TagInterface,
  titles: TagInterface[],
  characters: TagInterface[],
  tags: TagInterface[],
  created_at: string,
  updated_at: string,
}

export interface File {
  url: string,
  thumb: string,
}
