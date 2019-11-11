<script>
  import { onMount, afterUpdate } from "svelte";
  import { navigate} from "svelte-routing";

  export let meta;
  export let url;
  export let setPageId;
  let links_list = [];
  let prev_link = { disabled: true };
  let next_link = { disabled: true };

  onMount(() => console.log("mounted"));

  function drawPaginationControls() {
    links_list = [{
      url: url + "?page=" + meta.current_page,
      text: meta.current_page,
      active: true
    }];

    const left_pad = (meta.current_page - 3) >= 1 ? (meta.current_page - 3) : 1;
    const right_pad = (meta.current_page + 3) < meta.total_pages ? (meta.current_page + 3) : meta.total_pages;
    const prev_page = meta.current_page - 1;
    const next_page = meta.current_page + 1;

    for (let i = prev_page; i >= left_pad; i--) {
      links_list.unshift({ url: url + "?page=" + i, text: i, active: false });
    }

    for (let i = next_page; i <= right_pad; i++) {
      links_list.push({ url: url + "?page=" + i, text: i, active: false });
    }

    prev_link = {
      url: url + "?page=" + prev_page,
      disabled: meta.current_page <= 1,
      text: prev_page
    };

    next_link = {
      url: url + "?page=" + next_page,
      disabled: meta.current_page >= meta.total_pages,
      text: next_page
    };
  }

  function handleNavigation(link_entry) {
    navigate(link_entry.url);
    setPageId(link_entry.text);
  }

  afterUpdate(() => drawPaginationControls());

</script>

<style>
.pagination {
  display: inline-block;
}

.pagination .link {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  cursor: pointer;
}

.pagination .link.active {
  background-color: #FF3E00;
  color: white;
}

.pagination .link:hover:not(.active) {
  background-color: #ddd;
}

.pagination .link.disabled {
  color: currentColor;
  cursor: not-allowed;
  opacity: 0.5;
  text-decoration: none;
  pointer-events: none;
}
</style>

{#if links_list.length > 1}
  <div class="pagination">
    <div class="link" on:click={() => handleNavigation(prev_link)} class:disabled={prev_link.disabled}>❮</div>
    {#each links_list as link_entry}
      <div class="link" class:active={link_entry.active} on:click={() => handleNavigation(link_entry)}>{link_entry.text}</div>
    {/each}
    <div class="link" class:disabled={next_link.disabled} on:click={() => handleNavigation(next_link)}>❯</div>
  </div>
{/if}
