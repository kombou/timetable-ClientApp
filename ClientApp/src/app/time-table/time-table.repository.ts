import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Classe} from '../models/Classe';
import {Time} from '../models/Time';

@Injectable()
export class TimeTableRepository {
  url = 'http://localhost:5000/api/times';

  constructor(private httpClient: HttpClient) {}

  list(classe: Classe) {
    return  this.httpClient.get<Time[]>(this.url);
  }
}
