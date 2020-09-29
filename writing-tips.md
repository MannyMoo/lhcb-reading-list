# Some tips on writing scientific reports/presentations

## Structure

All scientific reports follow the same structure, whether it's a tabletop experiment in the undergrad labs or an LHC experiment, a three page report or a PhD thesis:

- __Introduction__: why do you want to do this measurement? What will we learn? What has been done before and what's new/better in your approach? Are there any theory predictions for comparison?

- __Experimental setup__: describe the equipment used and the data collected. In our case, this is normally a description of the LHCb detector, the data-taking runs, and the integrated luminosity of the data analysed. If simulated datasets are used, also describe how they're generated and the size of the samples.

- __Measurement methodology & results__: how do you extract your physics measurements from the data? This normally includes the selection of events that go into your final datasets, the subtraction of backgrounds, and finally the measurement of the physics parameters.

- __Systematic uncertainties__: evaluate the effect of any assumptions that go into the analysis. Eg, how you model your signal and background or how you account for detector resolutions and efficiencies. These will all require certain choices where it's not clear if one choice is better/more correct than the other. Assess the impact of these choices by trying different variants to see how they affect the final result. There may also be biases to the observables measured by the detector. The uncertainties on any input measurements, whether from simulations or other experiments, will also have to be factored in.

- __Conclusions__: briefly review the analysis method & give the final results, including statistical and systematic uncertainties. How do they compare to previous results/theory predictions? Are there any implications to these results? What have we learned? In essence, why do we care? Finally, what are the prospects for the future of this measurement? Are there opportunities to collect more data to improve the precision? Are there any limitations to the method employed, any limiting systematics, and potential for improvement?

## Tips

- Firstly, always remember: focus on the physics. Much of your project will have been spent on getting the method to work, and learning the technical skills required, but most of this won't go in the report. Avoid technical details unless they directly affect the physics results.

- Similarly, keep to the relevant details of the method. Possibly you tried some different approaches that didn't work before converging on the final version. Unless these failed attempts tell you something about the physics involved, they're irrelevant details. You're not telling the story of your project (that might go in your lab book), you just want to explain how you obtained your final results.

- Avoid jargon. Again, you've probably learnt a lot of jargon over your project, but your reader hasn't shared that experience. Your report should be fully intelligible to someone who hasn't worked on your experiment (eg, yourself before you started the project).

- If you have to use specialist terms, make sure they're relevant, and make sure to define them. Any acronyms should be defined at their first use.

- Always reference any statement/measurement that isn't part of your work that's presented in the report.

- For references to papers, just give the journal reference. If that's not available (the paper's not yet published) then you can reference the preprint on arxiv. Ideally, use the bibtex from Inspire-HEP.
