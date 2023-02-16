import svelte from 'rollup-plugin-svelte';
import commonjs from '@rollup/plugin-commonjs';
import resolve from '@rollup/plugin-node-resolve';
import replaceHtmlVars from 'rollup-plugin-replace-html-vars';
import livereload from 'rollup-plugin-livereload';
import { terser } from 'rollup-plugin-terser';
import sveltePreprocess from 'svelte-preprocess';
import typescript from '@rollup/plugin-typescript';
import css from 'rollup-plugin-css-only';

const production = !process.env.ROLLUP_WATCH;
const fingerprint = new Date().valueOf()

function serve() {
	let server;

	function toExit() {
		if (server) server.kill(0);
	}

	return {
		writeBundle() {
			if (server) return;
			server = require('child_process').spawn('npm', ['run', 'start', '--', '--dev'], {
				stdio: ['ignore', 'inherit', 'inherit'],
				shell: true
			});

			process.on('SIGTERM', toExit);
			process.on('exit', toExit);
		}
	};
}

export default {
	input: 'src/main.ts',
	output: {
		sourcemap: true,
		format: 'iife',
		name: 'app',
    entryFileNames: `bundle.${fingerprint}.js`,
    dir: '../public/build', // Path for storing prebuilt bundle files
	},
	plugins: [
    // If you have external dependencies installed from
		// npm, you'll most likely need these plugins. In
		// some cases you'll need additional configuration -
		// consult the documentation for details:
		// https://github.com/rollup/plugins/tree/master/packages/commonjs
		resolve({
      browser: true,
			dedupe: ['svelte']
		}),
		svelte({
			preprocess: sveltePreprocess({ sourceMap: !production }),
			compilerOptions: {
				dev: !production // enable run-time checks when not in production
			}
		}),
		typescript({
      sourceMap: !production,
			inlineSources: !production
		}),

    replaceHtmlVars({                   // Replace fingerprints of prebuilt bundle in index.html
      files: '../public/index.html',
      from: [
        /bundle.[0-9]+.js/i,
        /bundle.[0-9]+.css/i
      ],
      to: [
        `bundle.${fingerprint}.js`,
        `bundle.${fingerprint}.css`
      ],
    }),

    css({
      output: `bundle.${fingerprint}.css`// we'll extract any component CSS out into a separate file - better for performance
    }),

    commonjs(),
		!production && serve(),              // In dev mode, call `npm run start` once the bundle has been generated
		!production && livereload('public'), // Watch the `public` directory and refresh the browser on changes when not in production
		production && terser()               // If we're building for production (npm run build instead of npm run dev), minify
	],
	watch: {
		clearScreen: false
	}
};
