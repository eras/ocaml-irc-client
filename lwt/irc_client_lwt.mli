module Client : sig
  type connection_t

  val send_join : connection:connection_t -> channel:string -> unit Lwt.t

  val send_nick : connection:connection_t -> nick:string -> unit Lwt.t

  val send_pass : connection:connection_t -> password:string -> unit Lwt.t

  val send_pong : connection:connection_t -> message:string -> unit Lwt.t

  val send_privmsg : connection:connection_t ->
    target:string -> message:string -> unit Lwt.t

  val send_notice : connection:connection_t ->
    target:string -> message:string -> unit Lwt.t

  val send_quit : connection:connection_t -> unit Lwt.t

  val send_user : connection:connection_t ->
    username:string -> mode:int -> realname:string -> unit Lwt.t

  val connect : addr:Lwt_unix.inet_addr -> port:int -> username:string ->
    mode:int -> realname:string -> nick:string -> ?password:string -> unit ->
    connection_t Lwt.t

  val connect_by_name : server:string -> port:int -> username:string ->
    mode:int -> realname:string -> nick:string -> ?password:string -> unit ->
    connection_t option Lwt.t

  val listen : connection:connection_t ->
    callback:(
      connection:connection_t ->
      result:Irc_message.parse_result ->
      unit Lwt.t
    ) ->
    unit Lwt.t
end
