# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias update='sudo pacman -Syu && yay -Syu'
alias e='exit'
alias bashrc='vim ~/.bashrc'

fastfetch

# Fast cd
alias b='cd ..'
alias bb='cd ../..'
function mkcd () { mkdir -- "$1" && cd -- "$1"; }
# alias uni='cd ~/Documents/uni'
function uni() { cd -- ~/Uni/"$1"; }
alias gg='cd ~/Projects/game_dev/'

#fast ssh
#alias labssh="ssh a897461@lab000.cps.unizar.es"

#fast scp
function lpush() { scp "$1" a897461@lab000.cps.unizar.es:~/practicas/"$2"; }
function lpushdir() { scp -r "$1" a897461@lab000.cps.unizar.es:~/practicas/"$2"; }

function lpull() { scp a897461@lab000.cps.unizar.es:~/practicas/"$1" "$2"; }
function lpulldir() { scp -r a897461@lab000.cps.unizar.es:~/practicas/"$1" "$2"; }

# Apps shorthand
alias py='python3'
alias c='code .'
alias vim='nvim'
alias lvim='NVIM_APPNAME=lazyvim nvim'

function f(){ 
    firefox &
    exit 
    }
function ss(){ 
    spotify-launcher &
    exit 
    }

alias pdf='evince &'
alias visualboy='vbam'
alias ds='melonDS &'

# aoc2 shortcuts
aocgw(){
    ghdl -i --ieee=synopsys -fexplicit --workdir=WORK *.vhd
}
aocgm(){
    TEST=${1:-testbench}
    ghdl --gen-makefile --ieee=synopsys -fexplicit --workdir=WORK "$TEST" > Makefile
}
aocr(){
    TEST=${1:-testbench}
    TIME=${2:-100000}
    ./"$TEST" --stop-time="$TIME"ns --wave=test.ghw 
}
aocw(){
    gtkwave test.ghw &
}
aocc(){
    ghdl --clean --workdir=WORK
}

# bus
avanza(){
    if [ $# -eq 0 ]
    then
        curl -s "https://zaragoza.avanzagrupo.com/wp-admin/admin-ajax.php"      -X POST -d "action=tiempos_de_llegada" -d "selectPoste=611" |
        awk '
        /class="info-linea"/ {
            gsub(/<[^>]+>/, "");
            # Elimina las etiquetas HTML (<div>)
            bus=$1                 # Guarda el número de línea (ej: 39)
        }
        /class="info-tiempo/ {
            getline;               # Salta a la siguiente línea (donde está el texto "4 min" o "En la parada")
            gsub(/<[^>]+>/, "");   # Elimina el </div> de cierre
            gsub(/^[ \t]+|[ \t]+$/, ""); # Limpiar espacios en blanco sobrantes
            print "Bus " bus " - " $0
        }'
    else
        curl -s "https://zaragoza.avanzagrupo.com/wp-admin/admin-ajax.php"      -X POST -d "action=tiempos_de_llegada" -d "selectPoste=${1}" |     
        awk '
        /class="info-linea"/ {
            gsub(/<[^>]+>/, "");   # Elimina las etiquetas HTML (<div>)
            bus=$1                 # Guarda el número de línea (ej: 39)
        }
        /class="info-tiempo/ {
            getline;
            # Salta a la siguiente línea (donde está el texto "4 min" o "En la parada")
            gsub(/<[^>]+>/, "");
            # Elimina el </div> de cierre
            gsub(/^[ \t]+|[ \t]+$/, "");
            # Limpiar espacios en blanco sobrantes
            print "Bus " bus " - " $0
        }'

    fi

}

# Funny
alias sus='sudo'

if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    source /usr/share/git/completion/git-prompt.sh
    PS1='[♣]:(\u@\h)-[\w]$(__git_ps1 "::[%s]")\n[♧]~$ '
else
    PS1='[♣]:(\u@\h)-[\w]\n[♧]~$ '
fi

#PS1='┌──(\u@\h)-[\w]\n└─$ '
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
#PS1='[♣]:(\u@\h)-[\w]\n[♤]~$ '

export PICO_SDK_PATH="/usr/share/pico-sdk"

export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM
export DEVKITPPC=/opt/devkitpro/devkitPPC
export PATH=$PATH:/opt/ghdl/bin

export PATH=$PATH:$HOME/.spicetify
export EDITOR=nvim

export HISTSIZE=20000
