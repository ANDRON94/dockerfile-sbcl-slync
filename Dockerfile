FROM andron94/dockerfile-quicksbcl:1.5.1
MAINTAINER Andrii Tymchuk <makedonsky94@gmail.com>

# ========================= Install Slynk(Sly backend) =========================

# 1. Convenient definitions.
ENV SBCL_INIT_FILE .sbclrc

ENV SLYNK_PORT 4005

# 2. Define script for Slynk initialization:
#    - load Slynk;
#    - create&run Slynk server.
ENV SLYNK_INIT_SCRIPT="\
(ql:quickload \"slynk\")\n\
(slynk:create-server :interface \"0.0.0.0\" :port ${SLYNK_PORT} :dont-close t)"

# 2. Installation:
#  1. Add Slynk initialization script to SBCL startup script.
RUN echo -e ${SLYNK_INIT_SCRIPT} >> $HOME/${SBCL_INIT_FILE}

# ==============================================================================

# Allow 'world' connect to Slynk.
EXPOSE ${SLYNK_PORT}

CMD ["sbcl"]
