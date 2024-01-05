import pyzx as zx
import os
from os.path import join, isfile


def pyzx_optimize_nam(fn):
    circ = zx.Circuit.load(fn)
    g = circ.to_graph()
    zx.full_reduce(g, quiet=True)
    c_opt = zx.extract_circuit(g.copy())
    c_opt = zx.full_optimize(c_opt)
    stats = c_opt.stats_dict(depth=True)
    return stats["gates"], stats["twoqubit"], stats["depth"]


if __name__ == "__main__":
    circuit_order = [
        "tof_3",
        "barenco_tof_3",
        "mod5_4",
        "tof_4",
        "barenco_tof_4",
        "tof_5",
        "mod_mult_55",
        "vbe_adder_3",
        "barenco_tof_5",
        "csla_mux_3",
        "rc_adder_6",
        "gf2^4_mult",
        "tof_10",
        "mod_red_21",
        "hwb6",
        "gf2^5_mult",
        "csum_mux_9",
        "barenco_tof_10",
        "qcla_com_7",
        "ham15-low",
        "gf2^6_mult",
        "qcla_adder_10",
        "gf2^7_mult",
        "gf2^8_mult",
        "qcla_mod_7",
        "adder_8",
    ]
    qasm_path = "../circs/nam_circs/"
    qasm_fns = [
        fn
        for fn in os.listdir(qasm_path)
        if isfile(join(qasm_path, fn)) and fn[-4:] == "qasm"
    ]
    result_dict = {}
    for i, fn in enumerate(qasm_fns):
        if fn[:-5] not in circuit_order:
            continue
        full_path = qasm_path + fn
        gate_cnt, cnot_cnt, depth = pyzx_optimize_nam(full_path)
        result_dict[fn] = (gate_cnt, cnot_cnt, depth)
        print(f"{fn}: {gate_cnt} gates, {cnot_cnt} CNOTs, depth = {depth}, by pyzx")

    print("ordered gate count: ")
    for fn in circuit_order:
        print(result_dict[fn + ".qasm"][0])

    print("ordered cnot count: ")
    for fn in circuit_order:
        print(result_dict[fn + ".qasm"][1])

    print("ordered depth: ")
    for fn in circuit_order:
        print(result_dict[fn + ".qasm"][2])
