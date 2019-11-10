<script>
  import { Router, Link, Route } from "svelte-routing";
  import DaysIndex from "./svelte_app/views/days/index";
  import ProductsIndex from "./svelte_app/views/products/index";

  export let url = "";
</script>

<Router url="{url}">
  <nav>
    <Link to="/">Home</Link>
    <Link to="products">Products</Link>
  </nav>
  <div>
    <Route path="/" component="{DaysIndex}" />
    <Route path="products" component="{ProductsIndex}" />
  </div>
</Router>
