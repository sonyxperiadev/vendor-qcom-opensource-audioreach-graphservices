#ifndef LIB_PD_NOTIFIER_H
#define LIB_PD_NOTIFIER_H

#include <stdint.h>
#include "service_registry_notifier_v01.h"


#define PD_NOTIFIER_SUCCESS 0
#define PD_NOTIFIER_FAIL    1

typedef enum pd_event {
    EVENT_PD_DOWN = SERVREG_NOTIF_SERVICE_STATE_DOWN_V01,
    EVENT_PD_UP = SERVREG_NOTIF_SERVICE_STATE_UP_V01,
    EVENT_PD_UNKNOWN = SERVREG_NOTIF_SERVICE_STATE_UNINIT_V01,
} pd_event;

typedef qmi_servreg_notif_service_state_enum_type_v01 pd_state;
typedef void *PD_Notifier_Handle;

PD_Notifier_Handle *(*pd_notifier_alloc)(char *serviceName, char *clientName,
        uint32_t instance, void *cb, void *user_data);

uint32_t (*pd_notifier_register)(PD_Notifier_Handle *handle, pd_state *state);

uint32_t (*pd_notifier_deregister)(PD_Notifier_Handle *handle);

uint32_t (*pd_notifier_free)(PD_Notifier_Handle *handle);

uint32_t (*pd_notifier_restart_pd)(PD_Notifier_Handle *handle);

#endif /* LIB_PD_NOTIFIER_H */
