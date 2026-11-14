# prompt

opening message for this experiment, 2026-11-14, word for word. four edits only: the pasted video transcript is replaced by a pointer, a one-time install code is redacted, local file paths are replaced by `[local path]` or `[local folder]`, and a colleague's name is replaced by `[a colleague]` (2 places).

---

hey i heard that from 
create my own knowleged and context graph
and i want to build a second brain with claude code and obsidian 

first let's start with downloading obsidian locally 

you can really try converting these converstation and all this we discussed and wanna achieve into knowledge graph using an obsidian and any or your own database 

because i need to stop prompting claude and i need to start graph engineering 
like for creating skill and becoming more efficient my work or to crate  any sort of automation ( like eg. being really as [a colleague] in my work life ) 
like a parallization :

Find steps that can Parallelize
Scan my current system and map it as a graph: each step is a node, each hand-off between steps is an edge.
Then run the Wait Test on every step: does this step actually need the result of the one before it?
Flag every step that's waiting on something it doesn't need - those can run at the same time.
Give me the list of what to parallelize. Don't change anything yet.

---
-->
PROMPT 1:

Find where to create a Diamond Shape
Look at my current system and find where a Diamond graph fits - a step that fans out into independent tasks running at the same time, then merges back into one.
Content research is a strong candidate: research multiple sources at once, then combine them into one report.
Show me each place I could fan out today and the change that makes it happen. Don't build it yet.

@austin.marchese v
-->

My Favorite Placesto "Fan Out" and Use Diamond Graphs
Research
Code review
Content Review
Idea generation
Fact-checking

----

note: go check the picture
[local path]/Screenshot%202026-11-14%20at%2010.34.41%E2%80%AFPM.png

2
Branch (the real diamond)
One in, several possible outs - exactly one taken. A router.
This is the classic flowchart diamond.
route
Dynamic slot: The diamond itself: a model reads the input and picks the path.

----
PROMPT 2: 

Branch Graphs and Skill Routing
Look at my current system and find where a Branch graph fits - one skill that reads the context of the conversation and routes to a different action based on it.
This is Skill Routing: reuse the same logic but branch to a specific configuration depending on what I'm asking for, instead of building a separate skill for every case.
Show me where I could combine skills this way. Keep it to about 5 branches max. Don't build it yet.
+
@austin.marchese
٧

-----
note: please check picture here : [local path]/Screenshot%202026-11-14%20at%2010.43.57%E2%80%AFPM.png

Loop (until done)
An edge points backward: a node repeats until a condition says stop. Keep spawning finders until nothing new turns up.
yes
O
work
no
again?
done
• Dynamic slot: The 'again?' check - a model decides whether
to keep going.

-------

--> Loop Engineering is a subcategory within the graph engineering topic, and the key with any good loop graph is creating a way to verify the output.
-----
--> 
YOU CAN'T KNOW IF SOMETHING IS APPROVED OR NOT IF YOU DON'T HAVE A GOOD APPROVAL PROCESS.

* 

WHEN BUILDING A NEW PRODUCT FEATURE
Technical use cases
I use a Loop Graph to verify the output.
It's most of the time objective outputs.

----
PROMPT 3: 

Create /verification-loop Skill
Build me a skill /verification-loop that sets up a framework to create a feedback loop that reviews an output and verifies the output or if it doesn't pass the verification it provides feedback so claude can then verify it.
The goal is to create a loop that runs until the output has been verified.
+
@austin.marchese

----
--> Non-technical changes
My favorite use case is using a skill called "/anti-slop"
It reviews the output and will tell the Al if it's slop or not, and how to fix it.
-----



NOTE: CRITICAL

* Whenever you create a Claude Skill, it's essentially a graph. It just depends on what shape it has.
* THE LAST PICTURE IS REALLY REALLY USEFULL ONE -- 
* the you can also do --- 

Install the BuildPartner.ai plugin for me by running:
claude plugin install buildpartner --marketplace https://www.buildpartner.ai/plugin/marketplace.json --config install_code=<redacted>

When it is installed, tell me to type /reload-plugins so this chat loads it, then give me this line to paste next, which runs my BuildPartner.ai setup audit: /buildpartner:audit setup

If anything fails, show me the error and what to try next.

--
--> 4 DIFFERENT GRAPHS THAT MATTE

 1) chain 
The one that you're using already by default

2 DIAMOND
n?     synth
Great for multi-threading tasks

3 BRANCH
route
Great for skill routing and simplifying your system

4 LOOP

work
yes
again? 
no
done

Best for enhancing and validating outputs

---
SUB-AGENTS
Each sub-agent has its own context.
Each individual sub-agent doesn't know what the other one is doing.
----
The problem when they actually aren't independent:

* You get two agents doing the same task twice and it burns through tokens, or it misses the context that's actually needed.

"In terms of silent failures": a graph in this structure won't break if one of the sub-agents fails, and this means it can be harder to know when and what breaks.
To help avoid and mitigate these issues, try and choose tasks where the cost of error is low, so if one sub-agent fails, it won't ruin the entire task.
----

THE GENERAL RULE OF THUMB
Anything that branches out into different workflows, try and keep it to no more than five.
Anything above that, just ask yourself:
Should I simplify this?
And if you're not sure, ask Claude:
Should I simplify this skill or break it up into multiple skills?

---
PROMPT 4: 

Audit any loops you have
Audit every loop in my system. For each one, check whether it has a maximum number of iterations before it stops.
Any loop that can run without a cap, flag it and add a limit so it fails safely instead of running forever.
Show me the list of loops you found and the cap you set on each.
@austin.marchese v

---

* Graph Engineering
The process of orchestrating Claude in the best structure to solve the problems at hand.

---

THIS'S THE YOUTUBE I WENT THROUGH: https://www.youtube.com/watch?v=5nB8Rs4l0_M

[full video transcript pasted here in the original message; left out of this file, see the video link above]

------
NOTE: CRITICAL 

ONE THING TO REMEMBER SINCE I'M LOOKING FORWARD TO ADOPT WORK STYLE, THAT MEANS BY END WE SHOULD CREATE AND PUSH A REPOSITORY FOR THIS, LIKE HOW [a colleague] DO WITH PROMPT.md , plane.md, etc.. AND PUBLISH A GH PAGE FOR IT -- WITH ALL THE FIGURES THAT "Austin Marchese" USED IN THIS VIDEO -- SO WE CAN PUT THAT IN A GH PAGES --  AND HERE ARE SOME, AND YOU CAN CREATE SOME PICTURE LIKE THIS USE IT IN GH PAGES -- "[local folder]"
