import i3pystatus
from i3pystatus import Status

status = Status()

status.register("clock",
    format=" \uf133 %F %H:%M:%S",)

status.register("disk",
    path="/",
    format=" \uf0a0 System: {used}G ({percentage_used}%) ")

status.register("spotify",
    format=" {status} {title} - {artist}",
    status={
        "pause": "\uf04c",
        "play": "\uf04b",
        "stop": "\uf04d",
    })

status.run()
