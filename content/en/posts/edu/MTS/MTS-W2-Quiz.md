---
title: "Mathematical Thinking Stanford, W2 QUIZ"
date: 2023-09-25
categories:
  - IT
tags:
  - Internet
  - Math & CS
  - AI
---


[Math Foundation of computing, Stanford university.](https://web.stanford.edu/class/archive/cs/cs103/cs103.1126/) 

[Preliminary Course Notes - Keith Schwarz](http://web.stanford.edu/class/archive/cs/cs103/cs103.1126/notes/Mathematical%20Foundations%20of%20Computing.pdf)

implication has a truth part(conditional) and a causation part.

implication = conditional + causation

conditional means **⇒** 

**φ ⇒ ψ** is the truth part of “ φ  implies ψ ”. 

φ is the antecedent

ψ is the consequent
define the truth of φ⇒ψ in terms of the truth/falsity of φ and ψ.

## **Equivalence Quiz**

Which of the following **conditions** is necessary and sufficient for **the natural number $n$** **to be multiple of 10** ?

1. $n$ is multiple of 5
2. $n$ is multiple of 20
3. $n$ is even and multiple of 5
4. $n$ = 100 
5. $n^2$ is multiple of 100

**φ =** the natural number $n$ to be multiple of 10

**ψ =** following conditions

ψ is necessary for φ means **φ⇒ψ**

ψ is sufficient for φ means **ψ⇒φ**

| Conditions(**ψ** ) |  **$n$ (φ)** | Necessary
**φ ⇒ ψ**  | Sufficient
**ψ** **⇒ φ** | Bi-conditionals
**φ** ⇔ **ψ**  |
| --- | --- | --- | --- | --- |
| 1 | “ | ✔︎ |  |  |
| 2 | " |  | ✔︎ |  |
| 3 | “ | ✔︎ | ✔︎ | ✔︎ |
| 4 | “ |  | ✔︎ |  |
| 5 | “ | ✔︎ | ✔︎ | ✔︎ |

answer: both the third and fifth are necessary and sufficient **φ** ⇔ **ψ** 

explanation: 

1. if **φ,** then **ψ** ;
2. φ is **sufficient** for ψ ;
3. **φ** only if **ψ** [not the same as “if **ψ,** then **φ**” ] ;
4. **ψ** if **φ**;
5. **ψ** whenever **φ**;
6. ψ is **necessary** for ****φ;

⇔ iff = if only if = equivalence totally, double direction 

(**φ ⇒ ψ** )∧ (**ψ** **⇒ φ) = φ** ⇔ **ψ** 

ψ is necessary for φ means **φ⇒ψ**

φ is sufficient for ψ means **φ⇒ψ**

don’t confused the order of implication direction from one to another.

**Antecedent ⇒ Consequent,** φ ⇒ ψ 

if … ****then, ****only if, 

if, whenever, 

Keith cycles **only if** the sun shine, **Antecedent is Keith cycles.**

Keith  **⇒** Sunshine, if Keith cycles, it is sufficient to prove that there must be Sunshine, good day.

 it could not be reverse, because sunshine is a necessary reason, but not the sufficient reason that prove Keith cycles. 

if there was a sunshine day, but Keith might not cycles, she has other options of activities, so Keith is the antecedent for the sunshine, 

sufficient : must be the reason, **Antecedent and Consequent** could not be reverse, strong reason;

necessary: might be the reason, **Antecedent and Consequent** could be reverse, weak reason.

## Vocabulary

notion: concept.

notation: symbol, sign

[**Material implication**](https://en.wikipedia.org/wiki/Material_implication_(rule_of_inference))

Genuine Implication?

[Material conditional](https://en.wikipedia.org/wiki/Material_conditional)

antecedents and consequences 前因和后果

conditional

intuition 直觉

[causality](https://www.mathsisfun.com/definitions/causality.html)

genuine causation 

[nature number](https://en.wikipedia.org/wiki/Natural_number) 

# **QUIZ & Problem set.**

Which one is antecedent?  

1. **it is necessary that  $n$ is prime in order for ( $2^n$ − 1) to be prime.**
- A. $n$ is prime
- B. ( $2^n$ − 1) i prime.

**interpret**: $n$ is prime which is necessary (in order) for that ( $2^n$ − 1) is (to be) prime. B **⇒** A

B is antecedent.

1. The team wins only when Karl is playing.

A. team wins

B. Karl play.

**interpret**: The team wins only (if) when Karl is playing. A **⇒** B

A is antecedent.

1. **When** Karl plays the team wins.

A. Karl plays

B. team wins

**interpret**: When followed by Antecedent. A **⇒** B

A is antecedent.

1. The team wins **when** Karl plays.

A. Karl plays

B. team wins

**interpret**: When followed by Antecedent. A **⇒** B

A is antecedent.

1. For natural number m, n, is it truth that mn is even **iff** m and n are even?

 ****interpret:

if mn is even, then m and n are even

if m and n are even, then mn is even.

m=2, n=3, mn=6

False

> **iff** means two implication **equivalence**, double direction are equal.
mn means m multiply n, mxn
> 

1.  is it truth that mn is odd **iff** m and n are odd?

interpret:

if mn is odd, then m and n are odd

if m and n are odd, then mn is odd.

m=1, n=3, mn=3

True

# 14. prove equivalence.

| P | Q | -P | **-P V Q** | **P ⇒ Q** |
| --- | --- | --- | --- | --- |
| T | T | F | **T** | **T** |
| T | F | F | **F** | **F** |
| F | T | T | **T** | **T** |
| F | F | T | **T** | **T** |

| -P | - Q | P V Q | **- (P V Q)** | **-P ∧ -Q** |
| --- | --- | --- | --- | --- |
| F | F | T | **F** | **F** |
| F | T | T | **F** | **F** |
| T | F | T | **F** | **F** |
| T | T | F | **T** | **T** |

| -P | - Q | **-P V -Q** | P V -Q | **-(P V -Q)** |
| --- | --- | --- | --- | --- |
| F | F | **F** | T | **F** |
| F | T | **T** | T | **F** |
| T | F | **T** | F | **T** |
| T | T | **T** | T | **F** |

| P | Q | **-(P ∧ Q)** | **-P V -Q** |
| --- | --- | --- | --- |
| T | T | **F** | F |
| T | F | **T** | T |
| F | T | **T** | **T** |
| F | F | **T** | **T** |

| P | Q | **-(P ∧ Q)** | **-P V -Q** |
| --- | --- | --- | --- |
| T | T | **F** | F |
| T | F | **T** | T |
| F | T | **T** | **T** |
| F | F | **T** | **T** |

**De Morgan’s Law**

¬(φ ∨ ψ )  ⇔ ¬ φ ∧ ¬ψ 

¬(φ ∧ ψ )  ⇔ ¬ φ ∨ ¬ψ 

¬(φ ⇒ ψ)  ⇔  φ ∧ ¬ψ

φ ⇒ ψ  ⇔  ¬φ ∨ ψ

φ⇒(ψ⇒θ) ⇔ (φ∧ψ)⇒θ

¬[φ⇒(ψ∧θ)] ⇔ [¬(φ ⇒ ψ) V ¬(φ ⇒ θ)]

[φ ⇒ (ψ ∧ θ)] ⇔ [(φ ⇒ ψ) ∧ (φ ⇒ θ)]

[(φ ∨ ψ )⇒ θ] ⇔ [(φ ⇒ θ) ∧ (ψ ⇒ θ)]

P, Q, R

φ, ψ, θ

| φ  | ψ | θ | ψ∧θ | φ⇒(ψ∧θ) | ¬(φ⇒ψ) | ¬(φ⇒θ) | ¬(φ⇒ψ) V ¬(φ⇒θ) |
| --- | --- | --- | --- | --- | --- | --- | --- |
| T | T | T | T | T | F | F | F |
| T | F | F | F | F | T | T | T |
| F | T | F | F | T | F | F | F |
| F | F | T | F | T | F | F | F |

| φ  | ψ | θ | ψ ⇒ θ | **φ⇒(ψ⇒θ)** | φ ∧ ψ | **(φ∧ψ)⇒θ** |
| --- | --- | --- | --- | --- | --- | --- |
| T | T | T | T | T | T | **T** |
| T | F | F | T | T | F | **T** |
| F | T | F | F | T | F | **T** |
