#!/bin/bash


__clear() {
	/bin/echo -e -n "\033[2J"
}

__cursor_backward() {
	/bin/echo -e -n "\033[${1}D"
}

__cursor_down() {
	/bin/echo -e -n "\033[${1}B"
}

__cursor_forward() {
	/bin/echo -e -n "\033[${1}C"
}

__cursor_position() {
	/bin/echo -e -n "\033[${1};${2}H"
}

__cursor_restore() {
	/bin/echo -e -n "\033[u"
}

__cursor_save() {
	/bin/echo -e -n "\033[s"
}

__cursor_up() {
	/bin/echo -e -n "\033[${1}A"
}

