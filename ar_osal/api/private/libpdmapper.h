#ifndef LIB_PD_MAPPER_H
#define LIB_PD_MAPPER_H

#include <stdint.h>

#define SR_RESULT_SUCCESS 0

typedef void *SR_DL_Handle;

SR_DL_Handle *(*servreg_alloc_DLHandle)();

void (*servreg_free_DLHandle)(SR_DL_Handle *handle);

uint32_t (*servreg_get_domainlist)(char *service, SR_DL_Handle *handle);

int (*servreg_get_numentries)(SR_DL_Handle *handle);

uint32_t(*servreg_get_entry)(SR_DL_Handle *handle, char **buffer,
        int *instance, int *service_data_valid, int *service_data, uint32_t entry_number);

#endif /* LIB_PD_MAPPER_H */
