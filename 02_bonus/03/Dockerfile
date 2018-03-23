# RUN : docker run -d -p 8080:80 <incroyable>
# test: http://192.168.99.100:8080/

FROM php

RUN echo "<?php echo 'mais cest incroyable ca dis donc!';" > /tmp/index.php

CMD ["php", "-S", "0.0.0.0:80", "-t", "/tmp"]
