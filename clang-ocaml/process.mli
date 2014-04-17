(*
 *  Copyright (c) 2014, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the BSD-style license found in the
 *  LICENSE file in the root directory of this source tree. An additional grant
 *  of patent rights can be found in the PATENTS file in the same directory.
 *
 *)

val file_exists : string -> bool
val mktemp : string -> string

val wait : int -> bool
val exec : string array -> Unix.file_descr -> Unix.file_descr -> Unix.file_descr -> bool
val close_in : in_channel -> unit
val close_out : out_channel -> unit

val tee : in_channel -> out_channel list -> unit
val copy : in_channel -> out_channel -> unit

val diff : string -> string -> out_channel -> bool
val gzip : in_channel -> out_channel -> bool
val gunzip : in_channel -> out_channel -> bool

val fork : (out_channel -> bool) -> int * in_channel

val compose :
  (in_channel -> out_channel -> bool) ->
  (in_channel -> out_channel -> bool) -> in_channel -> out_channel -> bool

val diff_on_same_input:
  (in_channel -> out_channel -> bool) ->
  (in_channel -> out_channel -> bool) ->
  in_channel -> out_channel -> bool
