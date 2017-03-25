import { Injectable } from '@angular/core';
import { Resolve } from '@angular/router';

@Injectable()
export class BootstrapResolver implements Resolve<any> {

  constructor() {}

  resolve() {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve();
      }, 2000);
    });
  }
}
