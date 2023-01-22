<#import "parts/common.ftlh" as c>


<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input type="text" name="filter" class="form-control" placeholder="Search by tag" value=${filter!}>
                <button type="submit" class="btn btn-primary mt-3">Search</button>
            </form>
        </div>
    </div>

    <a class="btn btn-primary mt-3 mb-3" data-bs-toggle="collapse" href="#collapseExample" role="button"
       aria-expanded="false" aria-controls="collapseExample">
        Add new message
    </a>
    <div class="collapse <#if message??>show</#if>" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group mt-3">
                    <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                           value="<#if message??>${message.text} </#if>"name="text" placeholder="Введите сообщение"/>
                    <#if textError??>
                        <div class="invalid-feedback">
                           ${textError}
                        </div>
                    </#if>
                </div>
                <div class="form-group mt-3">
                    <input type="text" class="form-control"
                           value="<#if message??>${message.tag} </#if> " name="tag" placeholder="Тэг">
                    <#if tagError??>
                        <div class="invalid-feedback">
                            ${tagError}
                        </div>
                    </#if>
                </div>
                <div class="form-group mt-3">
                    <div class="custom-file">
                        <input type="file" name="file" id="customFile">
                        <#--                        <label class="custom-file-label" for="customFile">Choose file</label>-->
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="_csrf.token"/>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary mt-3">Добавить</button>
                </div>
            </form>
        </div>
    </div>
    <div class="row row-cols-1 row-cols-md-4 g-3">
        <#--    <div class="card-columns">-->
        <#list messages as message>
            <div class="card my-4 mx-2">
                <#if message.filename??>
                    <img src="/img/${message.filename}" class="card-img-top">
                </#if>
                <div class="m-2">
                    <span>${message.text}</span>
                    <i>${message.tag}</i>
                </div>
                <div class="card-footer text-muted">
                    ${message.authorName}
                </div>
            </div>
        <#else>
            No message
        </#list>
    </div>
</@c.page>