import Layout from './views/shared/layout';
import DaysIndex from './views/days/index';
import ProductsIndex from './views/products/index';

const routes = {
  '/': DaysIndex,
  '/products': ProductsIndex
};

export { routes }
