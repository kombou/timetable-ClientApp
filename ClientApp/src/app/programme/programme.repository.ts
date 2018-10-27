import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Programme} from '../models/Programme';

@Injectable()
export class ProgrammeRepository {
  url = 'http://localhost:500/api/programmes';

  constructor(private  httpClient: HttpClient) {}

  List() {
    return this.httpClient.get<Programme[]>(this.url);
  }

  get(id: number) {
    return this.httpClient.get<Programme>(`${this.url}/${id}`);
  }
}
