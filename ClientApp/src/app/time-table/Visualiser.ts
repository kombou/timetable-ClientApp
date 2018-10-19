import {Time} from '../models/Time';

export class Visualiser {
constructor(
  public jour: {
    '1': Time[],
    '2': Time[],
    '3': Time[],
    '4': Time[],
    '5': Time[]
  }
) {}
}
