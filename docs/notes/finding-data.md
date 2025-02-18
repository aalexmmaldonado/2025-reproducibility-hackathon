# Finding the Data

The manuscript provides clear information on the availability of data, materials, and software, specifying multiple repositories where the data sets and code can be accessed.

> Text corpora, computed features, and code to reproduce figures and results have been deposited in Hugging Face and Open Science Framework (OSF): Human–AI Parallel English Corpus, DOI: https://doi.org/10.57967/hf/3770 (30); Human–AI Parallel English Corpus, extracted Biber features, DOI: https://doi.org/10.57967/hf/3792 (27); Human–AI Parallel English Corpus, dependency parse, DOI: https://doi.org/10.57967/hf/3793 (31); COCA-AI Parallel Corpus, extracted Biber features, DOI: https://doi.org/10.57967/hf/3794 (28); and Analysis code, DOI: https://doi.org/10.17605/OSF.IO/7MRQN (29).

The data are deposited in Hugging Face and the Open Science Framework (OSF), each with distinct Digital Object Identifiers (DOIs). These include the Human–AI Parallel English Corpus, its extracted linguistic features, and dependency parses, as well as the COCA-AI Parallel Corpus and the analysis code.

While the multiple DOIs make it straightforward to locate specific elements of the data, this approach might appear somewhat fragmented. A more unified repository, such as Zenodo, which allows for a single DOI encompassing all resources, could have streamlined citation and retrieval. However, having separate DOIs for individual data components can also be beneficial, as they may be used independently in other research contexts.

Overall, the accessibility of the data is commendable, with clear mention in the manuscript ensuring ease of location.

## Retrieving the Data

While the data are readily available, retrieving them requires multiple downloads from different sources, which may introduce unnecessary complexity. A more seamless process could be achieved by providing a script that automates the downloading of all necessary files into a designated directory, ensuring consistency and ease of use.

For instance, a simple Bash script could be included to facilitate data retrieval, allowing users to run a single command to download and organize the files in their working directory. This would significantly reduce friction, especially for those attempting to reproduce the study's findings or build upon its methodology. By structuring the data retrieval process efficiently, users can focus on the analysis rather than dealing with file management complexities.

By implementing such an approach, the study could enhance its reproducibility and accessibility, particularly for researchers unfamiliar with the process of manually handling multiple data sets from different repositories.

```sh
--8<-- "docs/reproduce/get-data.sh"
```
