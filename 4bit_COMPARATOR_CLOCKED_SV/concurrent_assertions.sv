module cmp_concurrent_assertions(cmp_if.tb inter);

    default clocking cb @(posedge inter.clk); endclocking

    property req_followed_by_ack;
        inter.req |=> inter.ack;
    endproperty
    assert property (req_followed_by_ack)
    else $error("[SVA] REQ was not followed by ACK");

    property ack_requires_previous_req;
        inter.ack |-> $past(inter.req);
    endproperty
    assert property (ack_requires_previous_req)
    else $error("[SVA] ACK without prior REQ");

    property outputs_one_hot_on_ack;
        inter.ack |-> $onehot({inter.gt, inter.eq, inter.lt});
    endproperty
    assert property (outputs_one_hot_on_ack)
    else $error("[SVA] Outputs are not one-hot when ACK");

    property req_deasserts;
        inter.req |=> !inter.req;
    endproperty
    assert property (req_deasserts)
    else $error("[SVA] REQ did not deassert");

    property ack_one_cycle;
        inter.ack |=> !inter.ack;
    endproperty
    assert property (ack_one_cycle)
    else $error("[SVA] ACK lasted more than one cycle");

    property req_ack_exclusive;
        !(inter.req && inter.ack);
    endproperty
    assert property (req_ack_exclusive)
    else $error("[SVA] REQ and ACK both high");

    property inputs_stable_during_req;
        inter.req |-> $stable(inter.a) && $stable(inter.b);
    endproperty
    assert property (inputs_stable_during_req)
    else $error("[SVA] Inputs changed while REQ was high");

endmodule