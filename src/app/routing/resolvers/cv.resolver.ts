import { Injectable } from '@angular/core';
import { Resolve } from '@angular/router';

@Injectable()
export class CvResolver implements Resolve<any> {

  constructor() {}

  resolve() {
    return new Promise((resolve, reject) => {
      resolve();
    });
  }
}
