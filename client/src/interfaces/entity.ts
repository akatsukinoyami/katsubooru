import type { TagsType } from "../types";

export default interface EntityInterface {
  id: number,
  file: string,
  file_hash: string,
  link: string,
  user_id: number,
  collection_id: number,
  tags: TagsType,
  thumb: string,
  created_at: string,
  updated_at: string,
}
