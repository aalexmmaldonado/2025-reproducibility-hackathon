# Licenses

First, I will be evaluating the copyright licenses that permit how I can use this data.
The [paper](https://www.pnas.org/doi/10.1073/pnas.2422455122) is distributed under the [CC BY-NC-ND 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/) license.
This paper was previously published on [arXiv](https://arxiv.org/abs/2410.16107), but it is not clear what license the material is released under.
However, the published manuscript makes no mention to the arXiv paper.

Data availability is mentioned in the snippet below.

> Text corpora, computed features, and code to reproduce figures and results have been deposited in Hugging Face and Open Science Framework (OSF): Human–AI Parallel English Corpus, DOI: <https://doi.org/10.57967/hf/3770> (30); Human–AI Parallel English Corpus, extracted Biber features, DOI: <https://doi.org/10.57967/hf/3792> (27); Human–AI Parallel English Corpus, dependency parse, DOI: <https://doi.org/10.57967/hf/3793> (31); COCA-AI Parallel Corpus, extracted Biber features, DOI: <https://doi.org/10.57967/hf/3794> (28); and Analysis code, DOI: <https://doi.org/10.17605/OSF.IO/7MRQN>(29).

All of the [Hugging Face](https://huggingface.co/) data are released under the [MIT license](https://opensource.org/license/mit).

## What can we do?

The licensing landscape for this project is muddled by conflicting or absent licenses, creating uncertainty about how the materials can be used or adapted.
While the Reproducibility Hackathon OSF repository is covered under the relatively permissive [CC BY 4.0 license](https://creativecommons.org/licenses/by/4.0/deed.en), the OSF project associated with the published manuscript does not appear to have an open-source license attached.
The manuscript itself is subject to a non-derivative clause, which restricts the creation of new works based on its content.
Taken together, these inconsistencies make it difficult to ascertain exactly what can be reused, repurposed, or merged across the various resources.

## Incorrect licenses?

Using the MIT License for datasets can create confusion because the MIT License is originally tailored to software, not data.
Its text explicitly grants permission to use, copy, modify, and distribute “the Software”&mdash;language which does not always translate cleanly to the unique considerations surrounding data, such as database rights or data privacy concerns.
Although technically one could apply the MIT License to almost any work, it is not well-suited for the typical needs and legal nuances of datasets.

A Creative Commons (CC) license is generally more appropriate for data because it was designed to address a broader range of works, including text, images, and datasets.
By using a CC license—like CC BY or CC0&mdash;you ensure that users of your data clearly understand their rights to share, adapt, or combine your dataset with others, all while protecting your interests if you want proper attribution or if you wish to place your data in the public domain.
Adopting a Creative Commons license usually minimizes licensing ambiguities, making your dataset more accessible and legally compatible in the open data community.
