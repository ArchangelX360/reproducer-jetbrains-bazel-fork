def _resource_rule_impl(ctx):
    output_resource_dir = ctx.actions.declare_directory(ctx.attr.name + "_generated")

    ctx.actions.run(
        inputs = [],
        outputs = [output_resource_dir],
        executable = ctx.executable._tool,
        arguments = [
            output_resource_dir.path,
        ],
        mnemonic = "GenerateResource",
        progress_message = "Creating resources",
    )

    return [
        DefaultInfo(files = depset([output_resource_dir])),
    ]

resource_rule = rule(
    attrs = {
        "_tool": attr.label(
            executable = True,
            cfg = "exec",
            default = "//:create_file",
        ),
    },
    implementation = _resource_rule_impl,
)

def _consumer_rule_impl(ctx):
    output_res = ctx.actions.declare_file(ctx.attr.name + "_consumed")

    args = ctx.actions.args()
    args.add(output_res.path)
    args.add_all(ctx.files.resources)

    ctx.actions.run(
        inputs = ctx.files.resources,
        outputs = [output_res],
        executable = ctx.executable._tool,
        arguments = [args],
        mnemonic = "GenerateResource",
        progress_message = "Creating resources",
    )

    return [
        DefaultInfo(files = depset([output_res])),
    ]

consumer_rule = rule(
    attrs = {
        "resources": attr.label_list(
            doc = """The list of resource groups to create the target.""",
            allow_files = True,
        ),
        "_tool": attr.label(
            executable = True,
            cfg = "exec",
            default = "//:consume_files",
        ),
    },
    implementation = _consumer_rule_impl,
)
