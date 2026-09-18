vec4 animation(vec2 uv) {
    float p = umbriel_direction > 0.0 ? umbriel_clamped_progress : 1.0 - umbriel_clamped_progress;
    float ep = smoothstep(0.0, 1.0, p);
    float un = 1.0 - ep;

    float aspect = umbriel_size.x / umbriel_size.y;
    vec2 scaleV = vec2(aspect, 1.0);
    vec2 diff = (uv - 0.5) * scaleV;
    float dist = length(diff);
    float ang = atan(diff.y, diff.x);

    float edge = 0.07;
    float maxDist = length(vec2(0.5 * aspect, 0.5));
    float radius = ep * (maxDist + edge);
    float mask = 1.0 - smoothstep(radius - edge, radius, dist);

    float swirl = un * un * 3.5 * max(1.0 - dist / (maxDist + 0.001), 0.0);
    swirl *= umbriel_direction;

    float scl = mix(1.18, 1.0, ep);

    float newAng = ang + swirl;
    vec2 warped  = vec2(cos(newAng), sin(newAng)) * dist;
    vec2 sampleUv = 0.5 + (warped / scl) / scaleV;

    float ca = un * 0.018 * dist;
    vec2 caDir = dist > 0.0001 ? diff / dist : vec2(0.0);
    vec2 caOff = (caDir / scaleV) * ca;

    vec4 cR = umbriel_sample(sampleUv + caOff);
    vec4 cG = umbriel_sample(sampleUv);
    vec4 cB = umbriel_sample(sampleUv - caOff);
    vec4 col = vec4(cR.r, cG.g, cB.b, cG.a);

    float rim = mask * (1.0 - mask) * 4.0;
    vec3 glow = vec3(0.35, 0.75, 1.0) * rim * (0.6 + 0.4 * un);

    vec3 outRgb = col.rgb * mask + glow;
    float outA = clamp(col.a * mask + rim, 0.0, 1.0);

    return vec4(outRgb, outA);
}
