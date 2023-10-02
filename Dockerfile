FROM node
ENV HOME /projectDBP
COPY ./main.sh ./main.sh
COPY ./Crystal.inf ./Crystal.inf
COPY ./Cascada.inf ./Cascada.inf
COPY ./Espiral.inf ./Espiral.inf
COPY ./Kanban.inf ./Kanban.inf
COPY ./ModeloV.inf ./ModeloV.inf
COPY ./SCRUM.inf ./SCRUM.inf
COPY ./XP.inf ./XP.inf
CMD ["bash","./main.sh"]
