(* OCamlSDL2 - An OCaml interface to the SDL2 library
 Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* Surface definition and management *)

type t

external create_rgb :
  width:int ->
  height:int ->
  depth:int -> t
  = "caml_SDL_CreateRGBSurface"

external create_rgb2 :
  width:int ->
  height:int ->
  depth:int ->
  ?r_mask:int32 ->
  ?g_mask:int32 ->
  ?b_mask:int32 ->
  ?a_mask:int32 ->
  unit -> t
  = "caml_SDL_CreateRGBSurface2_bytecode"
    "caml_SDL_CreateRGBSurface2"

external create_rgb3 :
  width:int ->
  height:int ->
  depth:int ->
  ?rgba_mask:int32 * int32 * int32 * int32 ->
  unit -> t
  = "caml_SDL_CreateRGBSurface3"

external free : t -> unit
  = "caml_SDL_FreeSurface"

external load_bmp : filename:string -> t
  = "caml_SDL_LoadBMP"

external save_bmp : t -> filename:string -> unit
  = "caml_SDL_SaveBMP"

external fill_rect :
  dst:t -> rect:Sdlrect.t ->
  color:int32 -> unit
  = "caml_SDL_FillRect"

external blit_surface :
  src:t -> src_rect:Sdlrect.t ->
  dst:t -> dst_rect:Sdlrect.t ->
  Sdlrect.t
  = "caml_SDL_BlitSurface"

external blit_surf :
  src:t -> dst:t -> dst_rect:Sdlrect.t ->
  Sdlrect.t
  = "caml_SDL_BlitSurf"

external blit_surfs :
  src:t -> dst:t -> dst_rect:Sdlrect.t -> unit
  = "caml_SDL_BlitSurfs"

external blit_pixels_unsafe :
  t -> string -> unit
  = "caml_SDL_Surface_Blit_Pixels"

external set_color_key : t -> enable:bool -> key:int32 -> unit
  = "caml_SDL_SetColorKey"

external set_color_key_map_rgb : t -> enable:bool ->
  rgb:(int * int * int) -> unit
  = "caml_SDL_SetColorKey_MapRGB"

external get_width : t -> int = "caml_SDL_SurfaceGetWidth"
external get_height : t -> int = "caml_SDL_SurfaceGetHeight"

external get_dims : t -> int * int = "caml_SDL_SurfaceGetDims"

external get_pitch : t -> int = "caml_SDL_SurfaceGetPitch"

external get_pixel32_unsafe : t -> x:int -> y:int -> int32
  = "caml_SDL_SurfaceGetPixel32"

external get_pixel16_unsafe : t -> x:int -> y:int -> int32
  = "caml_SDL_SurfaceGetPixel16"

external get_pixel8_unsafe : t -> x:int -> y:int -> int32
  = "caml_SDL_SurfaceGetPixel8"

external get_bits_per_pixel : t -> int
  = "caml_SDL_SurfaceGetBitsPerPixel"

external has_palette : t -> bool
  = "caml_SDL_SurfaceHasPalette"

external palette_num_colors : t -> int
  = "caml_SDL_SurfacePaletteColors"

external set_blend_mode : t -> SdlblendMode.t -> unit
  = "caml_SDL_SetSurfaceBlendMode"

external get_pixelformat_t : t -> SdlpixelFormat.t
  = "caml_SDL_Surface_get_pixelformat_t"

external get_pixels : t -> string
  = "caml_SDL_Surface_get_pixels"

