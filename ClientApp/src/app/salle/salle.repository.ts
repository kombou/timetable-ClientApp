import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Salle} from '../models/Salle';

@Injectable()
export class SalleRepository {
  url = 'http://localhost:5000/api/salles';

  constructor(private  httpClient: HttpClient) {}

  List() {
    return this.httpClient.get<Salle[]>(this.url);
  }

  Get(id: number) {
    return this.httpClient.get<Salle>(`${this.url}/${id}`);
  }
}
