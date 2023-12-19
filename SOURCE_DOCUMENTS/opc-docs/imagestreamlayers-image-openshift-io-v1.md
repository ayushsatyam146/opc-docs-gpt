// Automatically generated by 'openshift-apidocs-gen'. Do not edit.
:_mod-docs-content-type: ASSEMBLY
[id="imagestreamlayers-image-openshift-io-v1"]
= ImageStreamLayers [image.openshift.io/v1]
:toc: macro
:toc-title:

toc::[]


Description::
+
--
ImageStreamLayers describes information about the layers referenced by images in this image stream.

Compatibility level 1: Stable within a major release for a minimum of 12 months or 3 minor releases (whichever is longer).
--

Type::
  `object`

Required::
  - `blobs`
  - `images`


== Specification

[cols="1,1,1",options="header"]
|===
| Property | Type | Description

| `apiVersion`
| `string`
| APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources

| `blobs`
| `object`
| blobs is a map of blob name to metadata about the blob.

| `blobs{}`
| `object`
| ImageLayerData contains metadata about an image layer.

| `images`
| `object`
| images is a map between an image name and the names of the blobs and config that comprise the image.

| `images{}`
| `object`
| ImageBlobReferences describes the blob references within an image.

| `kind`
| `string`
| Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds

| `metadata`
| xref:../objects/index.adoc#io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta[`ObjectMeta`]
| metadata is the standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

|===
=== .blobs
Description::
+
--
blobs is a map of blob name to metadata about the blob.
--

Type::
  `object`




=== .blobs{}
Description::
+
--
ImageLayerData contains metadata about an image layer.
--

Type::
  `object`

Required::
  - `size`
  - `mediaType`



[cols="1,1,1",options="header"]
|===
| Property | Type | Description

| `mediaType`
| `string`
| MediaType of the referenced object.

| `size`
| `integer`
| Size of the layer in bytes as defined by the underlying store. This field is optional if the necessary information about size is not available.

|===
=== .images
Description::
+
--
images is a map between an image name and the names of the blobs and config that comprise the image.
--

Type::
  `object`




=== .images{}
Description::
+
--
ImageBlobReferences describes the blob references within an image.
--

Type::
  `object`




[cols="1,1,1",options="header"]
|===
| Property | Type | Description

| `config`
| `string`
| config, if set, is the blob that contains the image config. Some images do not have separate config blobs and this field will be set to nil if so.

| `imageMissing`
| `boolean`
| imageMissing is true if the image is referenced by the image stream but the image object has been deleted from the API by an administrator. When this field is set, layers and config fields may be empty and callers that depend on the image metadata should consider the image to be unavailable for download or viewing.

| `layers`
| `array (string)`
| layers is the list of blobs that compose this image, from base layer to top layer. All layers referenced by this array will be defined in the blobs map. Some images may have zero layers.

| `manifests`
| `array (string)`
| manifests is the list of other image names that this image points to. For a single architecture image, it is empty. For a multi-arch image, it consists of the digests of single architecture images, such images shouldn't have layers nor config.

|===

== API endpoints

The following API endpoints are available:

* `/apis/image.openshift.io/v1/namespaces/{namespace}/imagestreams/{name}/layers`
- `GET`: read layers of the specified ImageStream


=== /apis/image.openshift.io/v1/namespaces/{namespace}/imagestreams/{name}/layers

.Global path parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `name`
| `string`
| name of the ImageStreamLayers
| `namespace`
| `string`
| object name and auth scope, such as for teams and projects
|===

.Global query parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `pretty`
| `string`
| If 'true', then the output is pretty printed.
|===

HTTP method::
  `GET`

Description::
  read layers of the specified ImageStream


.HTTP responses
[cols="1,1",options="header"]
|===
| HTTP code | Reponse body
| 200 - OK
| xref:../image_apis/imagestreamlayers-image-openshift-io-v1.adoc#imagestreamlayers-image-openshift-io-v1[`ImageStreamLayers`] schema
| 401 - Unauthorized
| Empty
|===

