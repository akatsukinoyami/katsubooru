import commonjs from '@rollup/plugin-commonjs';
import resolve from '@rollup/plugin-node-resolve';
import typescript from '@rollup/plugin-typescript';
import livereload from 'rollup-plugin-livereload';
import sveltePreprocess from 'svelte-preprocess';
import replaceHtmlVars from 'rollup-plugin-replace-html-vars';
import svelte from 'rollup-plugin-svelte';
import { terser } from 'rollup-plugin-terser';
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
    commonjs(),

		resolve({
      browser: true,
      dedupe: ['svelte']
    }),

		svelte({
			preprocess: sveltePreprocess({
        sourceMap: !production
      }),
      compilerOptions: {
        dev: !production,             // enable run-time checks when not in production
        enableSourcemap: !production  // Set to  true if you want them
      }
		}),

		typescript({
      sourceMap: true, //!production,
			inlineSources: !production
		}),

    // we'll extract any component CSS out into a separate file - better for performance
    css({
      output: `bundle.${fingerprint}.css`,
      sourceMap: true
    }),

    // Replace fingerprints of prebuilt bundle in index.html
    replaceHtmlVars({
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

		!production && serve(),               // In dev mode, call `npm run start` once the bundle has been generated
		!production && livereload('public'),  // Watch the `public` directory and refresh the browser on changes when not in production
		production && terser()                // If we're building for production (npm run build instead of npm run dev), minify
	],
	watch: {
		clearScreen: false
	}
};
