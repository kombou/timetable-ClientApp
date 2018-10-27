import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Jour} from '../models/Jour';

@Injectable()
export class  JourRepository {
  url = 'http://localhost:5000/api/jours';

  constructor(private  httpClient: HttpClient) {}

  List() {
    return this.httpClient.get<Jour[]>(this.url);
  }

  Get(id: number) {
    return this.httpClient.get<Jour>(`${this.url}/${id}`);
  }
}
