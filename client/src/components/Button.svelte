<script lang="ts">
  export let text: string;
</script>

<div class="btn">
    <span>{text}</span>
    <slot/>
</div>
