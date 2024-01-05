from qiskit import QuantumCircuit, transpile
import os
from os.path import join, isfile


def qiskit_optimize_ibm(fn, output_dir: str):
    circ = QuantumCircuit.from_qasm_file(fn)
    optimized_circ = transpile(
        circ, basis_gates=["rz", "cx", "h", "x"], optimization_level=3
    )
    count_dict = optimized_circ.count_ops()
    output_path = output_dir + fn.split("/")[-1]
    optimized_circ.qasm(filename=output_path)
    return (
        sum([count_dict[k] for k in count_dict]),
        count_dict["cx"],
        optimized_circ.depth(),
    )


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
    path = "../circs/nam_circs/"
    fns = [
        fn for fn in os.listdir(path) if isfile(join(path, fn)) and fn[-4:] == "qasm"
    ]
    output_dir = "qiskit_nam_optimized/"
    if not os.path.exists(output_dir):
        os.mkdir(output_dir)
    result_dict = {}
    for i, fn in enumerate(fns):
        if fn[:-5] not in circuit_order:
            continue
        gate_cnt, cnot_cnt, depth = qiskit_optimize_ibm(path + fn, output_dir)
        result_dict[fn] = [gate_cnt, cnot_cnt, depth]
        print(f"{fn}, gate: {gate_cnt}, cnot: {cnot_cnt}, depth: {depth}, by Qiskit")

    print("ordered gate count: ")
    for fn in circuit_order:
        print(result_dict[fn + ".qasm"][0])

    print("ordered cnot count: ")
    for fn in circuit_order:
        print(result_dict[fn + ".qasm"][1])

    print("ordered depth: ")
    for fn in circuit_order:
        print(result_dict[fn + ".qasm"][2])
