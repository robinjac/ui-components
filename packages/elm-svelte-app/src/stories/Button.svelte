<script>
  import './button.css';
  /**
   * Is this the principal call to action on the page?
   */
  export let primary = false;

  /**
   * What background color to use
   */
  export let backgroundColor;
  /**
   * How large should the button be?
   */
  export let size = 'medium';
  /**
   * Button contents
   */
  export let label = '';

  let mode = primary ? 'storybook-button--primary' : 'storybook-button--secondary';

  let style = backgroundColor ? `background-color: ${backgroundColor}` : '';

</script>

<button
  type="button"
  class={['storybook-button', `storybook-button--${size}`, mode].join(' ')}
  {style}
  on:click>
  {label}
</button>
