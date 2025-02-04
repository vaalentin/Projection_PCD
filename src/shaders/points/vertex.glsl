uniform mat4 viewMatrixCamera;
uniform mat4 projectionMatrixCamera;
uniform mat4 modelMatrixCamera;
uniform vec3 projPosition;

attribute vec4 color;

varying vec2 vUv;
varying vec4 vColor;
varying vec4 vWorldSpaceNormal;
varying vec4 vViewSpaceNormal;
varying vec3 vNormal;
varying vec4 vWorldPosition;
varying vec4 vTexCoords;

void main()
{
    vUv = uv;
    vColor = color;
    
    vWorldSpaceNormal = modelMatrix * vec4(normal, 0.0);
    vViewSpaceNormal = viewMatrix * modelMatrix * vec4(normal, 0.0);

    vNormal = mat3(modelMatrix) * normal;
    vWorldPosition = modelMatrix * vec4(position, 1.0);
    vTexCoords = projectionMatrixCamera * viewMatrixCamera * vWorldPosition;
    
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}