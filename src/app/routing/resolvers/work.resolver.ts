import { Injectable } from '@angular/core';
import { Resolve } from '@angular/router';

@Injectable()
export class WorkResolver implements Resolve<any> {

  constructor() {}

  resolve() {
    return new Promise((resolve, reject) => {
      resolve();
    });
  }
}
