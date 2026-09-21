module concurrent_assertions(alu_if.tb inter);

    default clocking cb @(posedge inter.clk);
    endclocking


    // =========================================================
    // BASIC REQ -> ACK PROTOCOL
    // =========================================================

    property req_followed_by_ack;

        inter.req |=> inter.ack;

    endproperty


    assert property (req_followed_by_ack)
    else
        $error(
            "[SVA] REQ was not followed by ACK"
        );


    // =========================================================
    // ACK SHOULD NOT HAPPEN WITHOUT A PREVIOUS REQUEST
    // =========================================================

    property ack_requires_previous_req;

        inter.ack |-> $past(inter.req);

    endproperty


    assert property (ack_requires_previous_req)
    else
        $error(
            "[SVA] ACK occurred without previous REQ"
        );


    // =========================================================
    // RESULT MUST BE VALID WHEN ACK IS ASSERTED
    // =========================================================

    property ack_implies_valid_result;

        inter.ack |-> !$isunknown(inter.result);

    endproperty


    assert property (ack_implies_valid_result)
    else
        $error(
            "[SVA] RESULT is unknown when ACK is high"
        );


    // =========================================================
    // ACK MUST NOT STAY HIGH FOR TWO CONSECUTIVE CYCLES
    // =========================================================

    property ack_one_cycle;

        inter.ack |=> !inter.ack;

    endproperty


    assert property (ack_one_cycle)
    else
        $error(
            "[SVA] ACK remained high for more than one cycle"
        );


    // =========================================================
    // REQ MUST FALL AFTER BEING ASSERTED
    // =========================================================

    property req_deasserts;

        inter.req |=> !inter.req;

    endproperty


    assert property (req_deasserts)
    else
        $error(
            "[SVA] REQ did not deassert after one cycle"
        );


    // =========================================================
    // REQ AND ACK MUST NOT BE HIGH TOGETHER
    // =========================================================

    property req_ack_exclusive;

        !(inter.req && inter.ack);

    endproperty


    assert property (req_ack_exclusive)
    else
        $error(
            "[SVA] REQ and ACK are high together"
        );


    // =========================================================
    // $ROSE
    // =========================================================

    property req_rises;

        $rose(inter.req) |-> inter.req;

    endproperty


    assert property (req_rises)
    else
        $error(
            "[SVA] REQ rose but is not high"
        );


    // =========================================================
    // $FELL
    // =========================================================

    property ack_falls;

        $fell(inter.ack) |-> !inter.ack;

    endproperty


    assert property (ack_falls)
    else
        $error(
            "[SVA] ACK fell but is not low"
        );


    // =========================================================
    // $STABLE
    // =========================================================

    property inputs_stable_during_request;

        inter.req |-> $stable(inter.opcode) &&
                      $stable(inter.a) &&
                      $stable(inter.b);

    endproperty


    assert property (inputs_stable_during_request)
    else
        $error(
            "[SVA] ALU inputs changed while REQ was active"
        );


    // =========================================================
    // $CHANGED
    // =========================================================

    property result_changes_when_ack;

        inter.ack |-> $changed(inter.result);

    endproperty


    assert property (result_changes_when_ack)
    else
        $error(
            "[SVA] RESULT did not change when ACK occurred"
        );


    // =========================================================
    // ## DELAY OPERATOR
    // =========================================================

    property req_then_ack;

        inter.req ##1 inter.ack;

    endproperty


    assert property (req_then_ack)
    else
        $error(
            "[SVA] REQ ##1 ACK sequence failed"
        );


    // =========================================================
    // OVERLAPPED IMPLICATION
    // =========================================================

    property ack_same_cycle_example;

        inter.ack |-> !$isunknown(inter.result);

    endproperty


    assert property (ack_same_cycle_example);


    // =========================================================
    // NON-OVERLAPPED IMPLICATION
    // =========================================================

    property req_next_cycle_ack;

        inter.req |=> inter.ack;

    endproperty


    assert property (req_next_cycle_ack);


    // =========================================================
    // ONEHOT
    // =========================================================

    // Exactly one of REQ and ACK must be high.
    // This is only an example and is NOT our desired
    // idle-state protocol, because both can legitimately
    // be zero.

    // assert property (
    //     $onehot({inter.req, inter.ack})
    // );


    // =========================================================
    // ONEHOT0
    // =========================================================

    property req_ack_at_most_one;

        $onehot0({inter.req, inter.ack});

    endproperty


    assert property (req_ack_at_most_one)
    else
        $error(
            "[SVA] REQ and ACK are both high"
        );

endmodule