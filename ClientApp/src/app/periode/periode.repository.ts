import {Injectable} from '@angular/core';
import {Periode} from '../models/Periode';
import {HttpClient} from '@angular/common/http';

@Injectable()
export class PeriodeRepository {
  url = 'http://localhost:5000/api/periodes';

  constructor(private  httpClient: HttpClient) {}

  List() {
    return this.httpClient.get<Periode[]>(this.url);
  }

  Get(id: number) {
    return this.httpClient.get<Periode>(`${this.url}/${id}`);
  }
}
