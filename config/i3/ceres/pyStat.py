import i3pystatus
from i3pystatus import Status

status = Status()

status.register("clock",
    format=" \uf133 %F %H:%M:%S",)

status.register("battery")

status.register("pulseaudio",
    format="\uf028 {volume}%",
    format_muted="\uf026 MUTED")

status.register("disk",
    path="/",
    format=" \uf0a0 System: {used}G ({percentage_used}%) ")

status.run()
