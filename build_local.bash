for d in $(jq -r '.include[]|.dist+"."+.ver' dist.json); do
    echo ${d%.*} ${d#*.}
    docker build . --build-arg dist=${d%.*} --build-arg ver=${d#*.} -t yasuyuky/ssh-test:${d}
done
