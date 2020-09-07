# Magepack 2.3 image

Helper tool for: https://www.npmjs.com/package/magepack

## Running the generator

```
docker run --net=host --rm -u 1000:1000 -v `pwd`:/source udovicic/magepack:2.3 magepack generate --cms-url="CMS_PAGE_URL" --category-url="CATEGORY_PAGE_URL" --product-url="SIMPLE_PRODUCT_PAGE_URL"
```

Running the above command will generate magepack.config.js file, where you can find each of the prepared bundles with the list of modules that will be included in them.

If the generation fails on checkout, it means that product can't be added to cart (most likely requries configuration).

## Bundling

Once you have generated bundler configuration, the next step would be to trigger the actual optimization after static content deploy stage has finished by running the following in shop root directory:

```
docker run --rm -u 1000:1000 -v `pwd`:/source udovicic/magepack:2.3 magepack bundle
```

This command will iterate over each deployed locale (excluding Magento/blank) and prepare bundles for each of them.

## Enabling

Once you made sure [Magepack Magento module](https://github.com/magesuite/magepack-magento) is installed, what is left is to enable it via admin panel under Stores->Configuration->Advanced->Developer or CLI:

```
bin/magento config:set dev/js/enable_magepack_js_bundling 1
```

and clearing the cache:

```
bin/magento cache:clean
```
