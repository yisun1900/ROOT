<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/css/buttons.css" type="text/css">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");
String lrbm=(String)session.getAttribute("dwbh");

String ssfgs=request.getParameter("ssfgs");
String dwbh=request.getParameter("dwbh");
String dqbm=cf.executeQuery("select dqbm from sq_dwxx where dwbh='"+ssfgs+"'");
String dhqh=cf.executeQuery("select dhqh from sq_dwxx where dwbh='"+ssfgs+"'");
if (dhqh==null || dhqh.equals(""))
{
	out.println("�����޵绰���ţ�����ϵϵͳ����Ա");
	return;
}

%>
<body>
<div class="container" style="padding-top:15px;">
<div class="row">
<div class="col-xs-12">
<div class="panel panel-primary">
  <div class="panel-heading">װ����ѯ���� -> ��ѯ�Ǽ� -> ¼������</div>
  <div class="panel-body">
  <form class="form-horizontal" method="post" action="SaveInsertCrm_zxkhxx.jsp" name="insertform" target="_blank">
  <div class="row">
    <div class="col-xs-6">
      <div class="form-group form-group-xs">
        <label class="col-xs-4 control-label" for="<%=dwbh%>">�ͻ������ֹ�˾</label>
        <div class="col-xs-8">
        <select class="form-control" name="ssfgs">
          <%cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");%> 
        </select>
        </div>
      </div>
      <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label">���������</label>  
          <div class="col-xs-8">
          <select class="form-control" name="sjsbh" onChange="changeSjsbh(insertform)">
              <option value=""></option>
              <%cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssdw='"+dwbh+"' and dwlx in('F3') order by dwbh","");%>
          </select>
          </div>
      </div>
      <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label">�г���</label>
          <div class="col-xs-8">
          <select class="form-control" name="ywybm" onChange="changeYwybm(insertform)">
            <option value=""></option>
            <%cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwflbm='07' and dwlx!='F4' and cxbz='N' order by dwbh","");%>
          </select>
          </div>
      </div>
      <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label">ҵ��Ա</label> 
          <div class="col-xs-8"> 
          <select class="form-control" name="ywy">
            <option value=""></option>
          </select>
          </div>
      </div>
      <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label">�곤</label>
          <div class="col-xs-8">  
          <select class="form-control" name="dianz">
              <option value=""></option>
              <%
                cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'('||sq_yhxx.dh||')' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+dwbh+"' and xzzwbm='�곤' and sq_yhxx.sfzszg in('Y','N') order by yhmc","");
              %>
          </select>
          </div>
      </div>
      <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label">С������</label>
          <div class="col-xs-8">  
          <select class="form-control" name="ywyssxz">
              <option value=""></option>
              <%cf.selectItem(out,"select xqlx c1,xqlx c2 from dm_xqlx order by xqlx","");%>
          </select>
        </div>
      </div>
      <div class="form-group form-group-xs has-error">
        <label class="col-xs-4 control-label">*�ͻ�����</label>
        <div class="col-xs-8">
        <input class="form-control" type="text" name="khxm" maxlength="50" onKeyUp="keyTo(xb[0])">
        <input type="hidden" name="boloniKhbh" maxlength="20" >
        </div>
      </div>
      <div class="form-group form-group-xs has-error">
        <label class="col-xs-4 control-label">*�Ա�</label>
        <div class="col-xs-8">
        <label class="radio-inline">
          <input type="radio" name="xb" value="M" onKeyUp="keyTo(lxfs)"/> ��
        </label>
        <label class="radio-inline">
          <input type="radio" name="xb" value="W" onKeyUp="keyTo(lxfs)"/> Ů
        </label>
        </div>
      </div>
    </div>
    <div class="col-xs-6">
       <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label">��ѯ����</label>
          <div class="col-xs-8">
          <select class="form-control" name="zxdm">
          <%if (dwbh.equals("")){
            out.println("<option value=\"\"></option>");
            cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and cxbz='N' and dwlx='F2' order by dwbh",dwbh);
          }else{
            cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' order by dwbh",dwbh);
          }
          %> 
          </select>
          </div>
        </div>
        <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label">���ʦ</label>
          <div class="col-xs-8">
          <select class="form-control" name="sjs">
              <%
                if (!zwbm.equals("04"))
                {
                  out.println("<option value=\"\"></option>");
                  cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'��'||sq_yhxx.dh||'��' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+dwbh+"' and sq_yhxx.zwbm in('23','04') and sq_yhxx.sfzszg in('Y','N') order by yhmc","");
                }
                else{
                  out.println("<option value=\""+yhmc+"\">"+yhmc+"</option>");
                }
              %>
          </select>
          </div>
        </div>
        <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label">�г���С��</label>
          <div class="col-xs-8">  
          <select class="form-control" name="ywyssxz" onChange="changeYwyssxz(insertform)">
              <option value=""></option>
          </select>
          </div>
        </div>
        <div class="form-group form-group-xs">
            <label class="col-xs-4 control-label">�г�������</label>
            <div class="col-xs-8">  
            <select class="form-control" name="scbjl">
              <option value=""></option>
              <%cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'('||sq_yhxx.dh||')' from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' and xzzwbm='�г�������' and sq_yhxx.sfzszg in('Y','N') order by yhmc","");
              %>
            </select>
          </div>
        </div>
        <div class="form-group form-group-xs">
            <label class="col-xs-4 control-label">�ͻ���Դ����</label>
            <div class="col-xs-8">  
            <select class="form-control" name="khzyxz">
              <option value=""></option>
              <%cf.selectItem(out,"select khzyxz c1,khzyxz c2 from dm_khzyxzbm order by khzyxzbm","");%>
            </select>
          </div>
        </div>
        <div class="form-group form-group-xs">
            <label class="col-xs-4 control-label">�ͻ�����</label>
            <div class="col-xs-8">   
            <select class="form-control" name="khjl">
              <%
                if (!zwbm.equals("03"))
                {
                  out.println("<option value=\"\"></option>");
                  cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'('||sq_yhxx.dh||')' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+dwbh+"' and sq_yhxx.zwbm='03' and sq_yhxx.sfzszg in('Y','N') order by yhmc","");
                
                }
                else{
                  out.println("<option value=\""+yhmc+"\">"+yhmc+"</option>");
                }
              %>
            </select>
          </div>
        </div>
        <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label">Ǣ̸�ǼǱ���</label>
          <div class="col-xs-8">
            <input class="form-control" name="djbbh" type="text" maxlength="20"/>
          </div>
        </div>
    </div>
    </div>
    <div class="row">
      <div class="col-xs-12">
        <div class="form-group form-group-xs">
          <label class="col-xs-2 control-label">��ϵ��ʽ</label>
          <div class="col-xs-9">
            <div class="input-group">
                <span class="input-group-btn">
                <input class="form-control" name="lxfs" type="text" maxlength="100" readonly/>
                <input type="hidden" name="khlxfs" value="" />
                <button class="btn btn-default" type="button" onClick="if (javaTrim(khxm)=='') {alert('¼��[�ͻ�����]');khxm.select();return false;};window.open('getLxfs.jsp?dhqh=<%=dhqh%>&khlxfs='+khlxfs.value+'&lxr='+khxm.value,'','height=400,width=800,top=200,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=no')">
                  ¼��绰
                </button>
                </span>        
              </div>
          </div>
      </div>
      <div class="form-group form-group-xs">
          <label class="col-xs-2 control-label">�����ʼ�</label>
          <div class="col-xs-10">
            <input class="form-control" type="text" name="email" maxlength="50" placeholder="ע�⣺�ж��������Ӣ�Ķ��ŷָ�">
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-xs-6">
        <div class="form-group form-group-xs has-error">
            <label class="col-xs-4 control-label">*��������</label>
            <div class="col-xs-8">
              <select class="form-control" name="cqbm" onKeyUp="keyGo(xqbm)" onChange="cf_fwdz(insertform)">
                  <option value=""></option>
                  <%cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm","");%> 
              </select>
            </div>
          </div>
          <div class="form-group form-group-xs has-error">
            <label class="col-xs-4 control-label">*С��</label>
            <div class="col-xs-8">
              <input class="form-control" type="text" name="xqbm" maxlength="50"  onKeyUp="changheIn(insertform)"  onblur="cf_fwdz(insertform)">
            </div>
          </div>
        </div>
        <div class="col-xs-6">
          <div class="form-group form-group-xs">
            <label class="col-xs-4 control-label">�ֵ�</label>
            <div class="col-xs-8">
              <input class="form-control" name="jiedao" type="text" onChange="cf_fwdz(insertform)" onKeyUp="keyTo(fwdz)" maxlength="50">
            </div>
          </div>
          <div class="form-group form-group-xs has-error">
          <label class="col-xs-4 control-label">*¥��</label>
          <div class="col-xs-8">
            <input class="form-control" type="text" name="louhao" maxlength="50" onKeyUp="keyTo(fwdz)"  onChange="cf_fwdz(insertform)">
          </div>
        </div>
        </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <div class="form-group form-group-xs has-success">
                <label class="col-xs-2 control-label">���ݵ�ַ</label>
                <div class="col-xs-10">
                  <input class="form-control" type="text" name="fwdz" maxlength="100" onKeyUp="keyTo(fwlxbm)" placeholder="ע�⣺���ݵ�ַ���������ֵ���С����¥�ţ��Զ����ɣ�����¼��" readonly>
                </div>
            </div>
            <div class="form-group form-group-xs has-success">
                <label class="col-xs-2 control-label">��Чͨ�ŵ�ַ</label>
                <div class="col-xs-10">
                  <input class="form-control" name="yxtxdz" type="text" maxlength="100"/>
                </div>
            </div>            
          </div>
        </div>
        <div class="row">
          <div class="col-xs-6">
            <div class="form-group form-group-xs has-error">
              <label class="col-xs-4 control-label">*�Ƿ�Զ�̿ͻ�</label>
              <div class="col-xs-8">
              <label class="radio-inline">
                <input type="radio" name="sfyckh" value="Y"> ��
              </label>
              <label class="radio-inline">
                <input type="radio" name="sfyckh" value="N"> ��
              </label>
              </div>
            </div>
          </div>
          <div class="col-xs-6">
            <div class="form-group form-group-xs">
              <label class="col-xs-4 control-label">�ɵ�����</label>
              <div class="col-xs-8">
                <select name="pdqybm" class="form-control">
                <option value=""></option>
                <%cf.selectItem(out,"select pdqybm,pdqymc from dm_pdqybm where dqbm='"+dqbm+"' order by pdqybm","");%>
              </select>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <div class="form-group form-group-xs">
              <label class="col-xs-2 control-label">�μӹ�˾�����</label>
              <div class="col-xs-10">
                <select name="cxhdbm" class="form-control">
                  <option value=""></option>
                  <%cf.selectItem(out,"select distinct jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(����'||jc_cxhd.dj||'��)' c2 from jc_cxhd,jc_cxhdsj where jc_cxhd.cxhdbm=jc_cxhdsj.cxhdbm and jc_cxhd.jsbz='N' and jc_cxhd.fgsbh='"+ssfgs+"' and  jc_cxhdsj.kssj<=TRUNC(SYSDATE) and jc_cxhdsj.cxjssj>=TRUNC(SYSDATE) and jc_cxhd.hdlx in('1','2') order by jc_cxhd.cxhdmc","");
                  %> 
                </select>
              </div>
            </div>
            <div class="form-group form-group-xs">
              <label class="col-xs-2 control-label">�μ�С�������</label>
              <div class="col-xs-10">
                <select name="cxhdbmxq" class="form-control">
                  <option value=""></option>
                  <%cf.selectItem(out,"select distinct jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(����'||jc_cxhd.dj||'��)' c2 from jc_cxhd,jc_cxhdsj where jc_cxhd.cxhdbm=jc_cxhdsj.cxhdbm and jc_cxhd.jsbz='N' and jc_cxhd.fgsbh='"+ssfgs+"' and  jc_cxhdsj.kssj<=TRUNC(SYSDATE) and jc_cxhdsj.cxjssj>=TRUNC(SYSDATE) and jc_cxhd.hdlx='3'  order by jc_cxhd.cxhdmc","");
                  %> 
                </select>
              </div>
            </div>
            <div class="form-group form-group-xs">
              <label class="col-xs-2 control-label">�μ�չ������</label>
              <div class="col-xs-10">
                <select name="cxhdbmzh" class="form-control">
                  <option value=""></option>
                  <%cf.selectItem(out,"select distinct jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(����'||jc_cxhd.dj||'��)' c2 from jc_cxhd,jc_cxhdsj where jc_cxhd.cxhdbm=jc_cxhdsj.cxhdbm and jc_cxhd.jsbz='N' and jc_cxhd.fgsbh='"+ssfgs+"' and  jc_cxhdsj.kssj<=TRUNC(SYSDATE) and jc_cxhdsj.cxjssj>=TRUNC(SYSDATE) and jc_cxhd.hdlx='4'  order by jc_cxhd.cxhdmc","");%> 
                </select>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-6">
            <div class="form-group form-group-xs">
              <label class="col-xs-4 control-label">������ҵ</label>
              <div class="col-xs-8">
                <select name="sshybm" class="form-control">
                  <option value=""></option>
                  <%cf.selectItem(out,"select sshybm,sshymc from dm_sshybm order by sshybm","");%>
                </select>
              </div>
            </div>
          </div>
          <div class="col-xs-6">
            <div class="form-group form-group-xs">
              <label class="col-xs-4 control-label">ְҵ</label>
              <div class="col-xs-8">
                <select name="zybm" class="form-control">
                  <option value=""></option>
                  <%cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm","");%>
              </select>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <div class="form-group form-group-xs">
              <label class="col-xs-2 control-label">��������</label>
              <div class="col-xs-10">
                <input class="form-control" name="gmyx" type="text" value="���ʩ�������ġ��Ҿߡ�����" maxlength="100"/>
              </select>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-6">
            <div class="form-group form-group-xs">
              <label class="col-xs-4 control-label">��������</label>
              <div class="col-xs-8">
              <select name="nlqjbm" class="form-control" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm","");%> 
                </select>
              </div>
            </div>
            <div class="form-group form-group-xs">
              <label class="col-xs-4 control-label">��������</label>
              <div class="col-xs-8">
                <select name="fwlxbm" class="form-control" onkeyup="keyTo(hxbm)">
                  <option value=""></option>
                  <%cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm","");%>
                </select>
              </div>
            </div>
            <div class="form-group form-group-xs">
              <label class="col-xs-4 control-label">�ƻ�����ʱ��</label>
              <div class="col-xs-8">
                <input class="form-control" type="text" name="jhjfsj" maxlength="10" onKeyUp="keyTo(xxlybm)" onDblClick="JSCalendar(this)">
              </div>
            </div>
            <div class="form-group form-group-xs">
              <label class="col-xs-4 control-label">����</label>
              <div class="col-xs-8">
                <select name="hxbm" class="form-control" onKeyUp="keyGo(fwmj)">
                  <option value=""></option>
                  <%cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");%> 
                </select>
              </div>
            </div>
            <div class="form-group form-group-xs has-error">
              <label class="col-xs-4 control-label">*���ڽ������</label>
              <div class="col-xs-8">
                <input class="form-control" type="text" name="fwmj" maxlength="8" onKeyUp="keyTo(fgyqbm)" >
              </div>
            </div>
            <div class="form-group form-group-xs">
              <label class="col-xs-4 control-label">Ԥ��װ��ʱ��</label>
              <div class="col-xs-8">
                <input class="form-control" type="text" name="yjzxsj" maxlength="10" onKeyUp="keyTo(xxlybm)" onDblClick="JSCalendar(this)">
              </div>
            </div> 
            <div class="form-group form-group-xs">
              <label class="col-xs-4 control-label">���Ҫ��</label>
              <div class="col-xs-8">
                <select name="fgyqbm" class="form-control" onKeyUp="keyTo(zxysbm)">
                  <option value=""></option>
                  <%cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm","");%> 
                </select>
              </div>
            </div>
            <div class="form-group form-group-xs">
              <label class="col-xs-4 control-label">װ��Ԥ��</label>
              <div class="col-xs-8">
                <select name="zxysbm" class="form-control" onKeyUp="keyGo(yjzxsj)" >
                  <option value=""></option>
                  <%cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm","");%> 
                </select>
              </div>
            </div>
            <div class="form-group form-group-xs has-error">
              <label class="col-xs-4 control-label">*��ϵ�ͻ�</label>
              <div class="col-xs-8">
                <select name="khlxbm" class="form-control" onKeyUp="keyGo(hdbz)">
                  <option value=""></option>
                  <%cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");%> 
                </select>
              </div>
            </div> 
          </div>
          <div class="col-xs-6">
            <div class="form-group form-group-xs">              
              <label class="col-xs-4 control-label">������</label>
              <div class="col-xs-8">
                <select name="ysrbm" class="form-control" onkeyup="keyGo(fj)">
                  <option value=""></option>
                  <%cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm","");%>
                </select>
              </div>
            </div>
            <div class="form-group form-group-xs">
              <label class="col-xs-4 control-label">���ۣ�Ԫ/m��</label>
              <div class="col-xs-8">
                <input class="form-control" type="text" name="fj" maxlength="20" onKeyUp="keyTo(cqbm)" >
              </div>
            </div>
           <div class="form-group form-group-xs has-error">
              <label class="col-xs-4 control-label">*��Ϣ��Դ</label>
              <div class="col-xs-8">
                <select class="form-control" name="xxlybm" onKeyUp="keyTo(khlxbm)" multiple style="height: 328px">
                  <%cf.selectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm","");%>
                </select>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <div class="form-group form-group-xs">
              <label class="col-xs-2 control-label">��Ϣ��Դ˵��</label>
              <div class="col-xs-10">
                <input class="form-control" name="xxlysm" type="text" maxlength="100">
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-6">
            <div class="form-group form-group-xs has-error">
              <label class="col-xs-4 control-label">*�ص���־</label>
              <div class="col-xs-8">
                <select class="form-control" name="hdbz" onChange="cf_hdbz(insertform)" onKeyUp="keyGo(hdr)">
                  <option value=""></option>
                  <%cf.selectItem(out,"select hdlxbm,hdlxmc from dm_hdlxbm order by hdlxbm","");%>
                </select>
              </div>
            </div>
          </div>
          <div class="col-xs-6">
            <div class="form-group form-group-xs">
              <label class="col-xs-4 control-label">�ص���</label>
              <div class="col-xs-8">
                <input class="form-control" type="text" name="hdr" maxlength="20">
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <div class="form-group form-group-xs">
                <label class="col-xs-2 control-label">�ص�װ�޵�ַ</label>
                <div class="col-xs-10">
                  <input class="form-control" type="text" name="cgdz" maxlength="100">
                </div>
              </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-6">
            <div class="form-group form-group-xs has-error">
              <label class="col-xs-4 control-label">*�Ƿ���ط�</label>
              <div class="col-xs-8">
                <label class="radio-inline">
                  <input type="radio" name="sfxhf"  value="Y"/> ��ط�
                </label>
                <label class="radio-inline">
                  <input type="radio" name="sfxhf"  value="N"/> ����ط�
                </label>
              </div>
            </div>
          </div>
          <div class="col-xs-6">
            <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">�ط�����</label>
                <div class="col-xs-8">
                  <input class="form-control" type="text" name="hfrq" maxlength="10" onKeyUp="keyGo(bz)" onDblClick="JSCalendar(this)"/> 
                </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-6">
            <div class="form-group form-group-xs has-error">
                <label class="col-xs-4 control-label">*������־</label>
                <div class="col-xs-8">
                  <label class="radio-inline">
                    <input name="lfbz" type="radio" value="N" checked/> δ����
                  </label>
                  <label class="radio-inline">
                    <input name="lfbz" type="radio" value="Y"/> ������
                  </label>
                </div>
            </div>
          </div>
          <div class="col-xs-6">
            <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">����ʱ��</label>
                <div class="col-xs-8">
                <input class="form-control" type="text" name="lfsj" maxlength="20" onDblClick="JSCalendar(this)"/>
                </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-6">
            <div class="form-group form-group-xs has-error">
                <label class="col-xs-4 control-label">*��װ��־</label>
                <div class="col-xs-8">
                  <label class="radio-inline">
                    <input type="radio" name="jzbz" value="1" checked/> ��װ
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="jzbz" value="2"/> ��װ
                  </label>
                </div>
            </div>
          </div>
          <div class="col-xs-6">
                        <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">����Ʒ��</label>
                <div class="col-xs-8">
                  <input class="form-control" name="clpp" type="text" maxlength="20" />
                </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-6">
                        <div class="form-group form-group-xs has-error">
                <label class="col-xs-4 control-label">*��Ч��Ϣ��־</label>
                <div class="col-xs-8">
                  <label class="radio-inline">
                    <input type="radio" name="yzxxbz" value="Y" checked/> ��Ч��Ϣ
                  </label>
                </div>
            </div>
          </div>
          <div class="col-xs-6">
                        <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">���ƺ�</label>
                <div class="col-xs-8">
                  <input class="form-control" name="clpp" type="text" maxlength="20" />
                </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <div class="form-group form-group-xs">
                <label class="col-xs-2 control-label">��������</label>
                <div class="col-xs-10">
                  <input class="form-control" type="text" name="czms" maxlength="50">
                </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <div class="form-group form-group-xs">
                <label class="col-xs-2 control-label">����Ҫ��</label>
                <div class="col-xs-10">
                  <textarea name="gnyq" class="form-control"></textarea>
                </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-6">
            <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">�������</label>
                <div class="col-xs-8">
                  <label class="radio-inline">
                    <input type="radio" name="hyzk" value="�ѻ�"/> �ѻ�
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="hyzk" value="δ��"/> δ��
                  </label>
                </div>
            </div>
          </div>
          <div class="col-xs-6">
            <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">�Ƿ����װ��</label>
                <div class="col-xs-8">
                  <label class="radio-inline">
                    <input type="radio" name="sfdkzx" value="��"/> ��
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="sfdkzx" value="��"/> ��
                  </label>
                </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-6">
                        <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">��������</label>
                <div class="col-xs-8">
                  <input class="form-control" type="text" name="hznl" maxlength="20" />
                </div>
            </div>
          </div>
          <div class="col-xs-6">
                        <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">����ͬס</label>
                <div class="col-xs-8">
                  <label class="radio-inline">
                    <input type="radio" name="lrtz" value="��"/> ��
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="lrtz" value="��"/> ��
                  </label>
                </div>
            </div>
          </div>
        </div>
                <div class="row">
          <div class="col-xs-6">
            <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">ԤԼ����ʱ��</label>
                <div class="col-xs-8">
                  <input class="form-control" type="text" name="yylfsj" maxlength="10" onDblClick="JSCalendar(this)">
                </div>
            </div>
            <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">�ƻ���ƽ��ͼʱ��</label>
                <div class="col-xs-8">
                  <input class="form-control" type="text" name="jhctsj" maxlength="10" onDblClick="JSCalendar(this)">
                </div>
            </div>
            <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">�ƻ���ʩ��ͼʱ��</label>
                <div class="col-xs-8">
                  <input class="form-control" type="text" name="jhcsgtsj" maxlength="10" onDblClick="JSCalendar(this)">
                </div>
            </div>
            <div class="form-group form-group-xs has-success">
                <label class="col-xs-4 control-label">*¼����</label>
                <div class="col-xs-8">
                  <input class="form-control" type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="10" readonly>
                </div>
            </div>
            <div class="form-group form-group-xs has-success">
                <label class="col-xs-4 control-label">*¼�벿��</label>
                <div class="col-xs-8">
                 <select name="zxdjbm" class="form-control">
                  <%cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");%>
              </select>
                </div>
            </div>
          </div>
          <div class="col-xs-6">
                        <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">�´�����ʱ��</label>
                <div class="col-xs-8">
                  <input type="text" name="xclfsj" class="form-control" maxlength="10" onDblClick="JSCalendar(this)">
                </div>
            </div>
            <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">�ƻ���Ч��ͼʱ��</label>
                <div class="col-xs-8">
                  <input type="text" name="jhcxgtsj" class="form-control" maxlength="10" onDblClick="JSCalendar(this)">
                </div>
            </div>
            <div class="form-group form-group-xs">
                <label class="col-xs-4 control-label">�ƻ������ӱ���ʱ��</label>
                <div class="col-xs-8">
                 <input type="text" name="jhzbjsj" class="form-control" maxlength="10" onDblClick="JSCalendar(this)">
                </div>
            </div>
            <div class="form-group form-group-xs has-success">
                <label class="col-xs-4 control-label">*¼��ʱ��</label>
                <div class="col-xs-8">
                  <input type="text" name="lrsj" value="<%=cf.today()%>" class="form-control" maxlength="10" readonly>
                </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <div class="form-group form-group-xs">
                <label class="col-xs-2 control-label">��ע</label>
                <div class="col-xs-10">
                  <textarea name="bz" onKeyUp="keyTo(savebutton)" class="form-control"></textarea>
                </div>
            </div>
          </div>
        </div>
  </form>
  </div>
    <div class="panel-footer text-center">
    <button class="button button-glow button-rounded button-raised button-action button-small" type="button" onClick="f_do(insertform)" name="savebutton">
      <i class="fa fa-save"></i> ����
    </button>
    <button class="button button-glow button-rounded button-raised button-primary button-small" type="button" onClick="insertform.savebutton.disabled=false">
      <i class="fa fa-reset"></i> �����ٴδ���
    </button>
  </div>
  </div>
  </div>
  </div>
  </div>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
  cf.ajax(out);//����AJAX
%>

var lx;
//�����������ⵥ��ʱ����������ʧ
document.onclick=function()
{
  try{
   insertform.valuelist.style.display='none';
  }catch(e){

  }
}

//�ı�����ֵ
function changheIn(FormName)
{   

  if(event.keyCode==13)//�س�
  {
    insertform.valuelist.style.display='none';
  }
  else if(event.keyCode==38)//�ϼ�ͷ
  {
    FormName.valuelist.focus();
    FormName.valuelist.options[FormName.valuelist.length-1].selected=true;
    mark="last";

    oldtext=FormName.xqbm.value;

    FormName.xqbm.value=FormName.valuelist.options[FormName.valuelist.length-1].text;
  }
  else if(event.keyCode==40)//�¼�ͷ
  {
    FormName.valuelist.focus();
    FormName.valuelist.options[0].selected=true;
    mark="first";

    oldtext=FormName.xqbm.value;

    FormName.xqbm.value=FormName.valuelist.options[0].text;
  }
  else{//������
    if(FormName.xqbm.value=="") 
    {
      insertform.valuelist.style.display='none';
      return;
    }

    //��ȡ�ͺ��б�
    var actionStr="/dhzx/scbkh/GetListByAjax.jsp?dqbm=<%=dqbm%>&invalue="+FormName.xqbm.value;

//    window.open(actionStr);
    lx="1";
    openAjax(actionStr);  
  }

}                                                                                                                                                       


function getAjax(ajaxRetStr) 
{
  if (lx=="1")
  {
    //ȥ��ǰ��Ļ��з�
    while (true)
    {
      if (ajaxRetStr.substring(0,1)=="\r")
      {
        ajaxRetStr=ajaxRetStr.substring(1);
      }
      else if (ajaxRetStr.substring(0,1)=="\n")
      {
        ajaxRetStr=ajaxRetStr.substring(1);
      }
      else{
        break;
      }
    }

    //����������
    insertform.valuelist.length=0;

    if (ajaxRetStr!="")
    {
      insertform.valuelist.style.display='block';
      strToItem3(insertform.valuelist,ajaxRetStr);
    }
    else{
      insertform.valuelist.style.display='none';
    }
  }
  else if (lx=="2")
  {
    strToItem2(insertform.sjs,ajaxRetStr);
  }
  else if (lx=="3")
  {
    strToItem2(insertform.ywy,ajaxRetStr);
  }
  else if (lx=="4")
  {
    strToSelect(insertform.ywyssxz,ajaxRetStr);

    var sql;
    sql =" select yhmc";
    sql+=" from sq_yhxx ";
    sql+=" where dwbh='"+insertform.ywybm.value+"'";
    sql+=" and sq_yhxx.zwbm in('19','24') and sq_yhxx.sfzszg in('Y','N') ";
    sql+=" ORDER BY yhmc";

    var actionStr="/ajax/getstr.jsp?sql="+sql;

//    window.open(actionStr);
    lx="3";
    openAjax(actionStr);
  }

}

//�ı���������Ŀ
function changeItem(FormName,field)
{
  if(event.keyCode==38)//�ϼ�ͷ
  {
    if (mark=="last")
    {
      mark="";
    }

    FormName.xqbm.value=field.options[field.selectedIndex].text;

    if (field.selectedIndex==0)
    {
      if (mark=="first")
      {
        field.value="";
        mark="";

        FormName.xqbm.value=oldtext;

        FormName.xqbm.focus();
      }
      else{
        mark="first";
      }
    }
  }
  else if(event.keyCode==40)//�¼�ͷ
  {
    if (mark=="first")
    {
      mark="";
    }

    FormName.xqbm.value=field.options[field.selectedIndex].text;

    if (field.selectedIndex==field.length-1)
    {
      if (mark=="last")
      {
        field.value="";
        mark="";

        FormName.xqbm.value=oldtext
        FormName.xqbm.focus();
      }
      else{
        mark="last";
      }
    }
  }
  else if(event.keyCode==13)//�س�
  {
    insertform.valuelist.style.display='none';
    FormName.xqbm.focus();
  }
}

//˫����������Ŀ
function selectCk(FormName,field)
{
  insertform.valuelist.style.display='none';
  FormName.xqbm.value=field.options[field.selectedIndex].text;
  FormName.xqbm.focus();
}


function changeSjsbh(FormName)
{
  FormName.sjs.length=1;

  if (FormName.sjsbh.value=="")
  {
    return;
  }


  var sql;
  sql =" select yhmc";
  sql+=" from sq_yhxx ";
  sql+=" where sjsbh='"+FormName.sjsbh.value+"'";
  sql+=" and sq_yhxx.zwbm in('23','04') and sq_yhxx.sfzszg in('Y','N') ";
  sql+=" ORDER BY yhmc";

  var actionStr="/ajax/getstr.jsp?sql="+sql;

//  window.open(actionStr);
  lx="2";
  openAjax(actionStr);

}

function changeYwyssxz(FormName)
{
  FormName.ywy.length=1;

  if (FormName.ywyssxz.value=="")
  {
    return;
  }


  var sql;
  sql =" select yhmc";
  sql+=" from sq_yhxx ";
  sql+=" where sjsbh='"+FormName.ywyssxz.value+"'";
  sql+=" and sq_yhxx.zwbm in('19','24') and sq_yhxx.sfzszg in('Y','N') ";
  sql+=" ORDER BY yhmc";

  var actionStr="/ajax/getstr.jsp?sql="+sql;

//  window.open(actionStr);
  lx="3";
  openAjax(actionStr);

}

function changeYwybm(FormName)
{
  FormName.ywy.length=1;
  FormName.ywyssxz.length=1;

  if (FormName.ywybm.value=="")
  {
    return;
  }

  var sql;
  sql =" select dwbh,dwmc";
  sql+=" from sq_dwxx ";
  sql+=" where dwlx='F4' and cxbz='N' and ssdw='"+FormName.ywybm.value+"'";
  sql+=" ORDER BY dwbh";

  var actionStr="/ajax/selectstr.jsp?sql="+sql;

//  window.open(actionStr);
  lx="4";
  openAjax(actionStr);

}

function cf_hdbz(FormName){  
  if(FormName.hdbz.value=="1") {//1���ǻص��� 2�����ʦ�ص���3��ʩ���ӻص���4���Ͽͻ��ص�;5��Ա���ص�
    FormName.cgdz.value="";
    FormName.hdr.value="";

    FormName.cgdz.disabled=true;
    FormName.hdr.disabled=true;
  }
  else {
    FormName.cgdz.disabled=false;
    FormName.hdr.disabled=false;
  }
}      

function cf_fwdz(FormName)
{  
  FormName.jiedao.value=strTrim(FormName.jiedao.value);
  FormName.xqbm.value=strTrim(FormName.xqbm.value);
  FormName.louhao.value=strTrim(FormName.louhao.value);
  FormName.fwdz.value=FormName.cqbm.options[FormName.cqbm.selectedIndex].text+FormName.jiedao.value+FormName.xqbm.value+FormName.louhao.value;
}      

function f_do(FormName)//����FormName:Form������
{
  cf_fwdz(FormName);

  if( javaTrim(FormName.khxm)=="") {
    alert("������[�ͻ�����]��");
    FormName.khxm.focus();
    return false;
  }
  if( !radioChecked(FormName.xb)) {
    alert("��ѡ��[�Ա�]��");
    FormName.xb[0].focus();
    return false;
  }
  if(FormName.lxfs.value=="") {
    alert("������[��ϵ��ʽ]��");
    FormName.lxfs.focus();
    return false;
  }

  if(!(isEmail(FormName.email, "�����ʼ�"))) {
    return false;
  }
  if(!(isNumber(FormName.fj, "����"))) {
    return false;
  }
  if( javaTrim(FormName.cqbm)=="") {
    alert("������[��������]��");
    FormName.cqbm.focus();
    return false;
  }
  if( javaTrim(FormName.xqbm)=="") {
    alert("������[С��]��");
    FormName.xqbm.focus();
    return false;
  }
  if( javaTrim(FormName.louhao)=="") {
    alert("������[¥��]��");
    FormName.louhao.focus();
    return false;
  }
    if( javaTrim(FormName.fwmj)=="") {
    alert("������[�������]��");
    FormName.fwmj.focus();
    return false;
  }
/*
*/
  if( javaTrim(FormName.fwdz)=="") {
    alert("������[���ݵ�ַ]��");
    FormName.fwdz.focus();
    return false;
  }
  if(!(isDatetime(FormName.jhjfsj, "�ƻ�����ʱ��"))) {
    return false;
  }
  if(!(isDatetime(FormName.yjzxsj, "Ԥ��װ��ʱ��"))) {
    return false;
  }
  if( !selectChecked(FormName.xxlybm)) {
    alert("������[��Ϣ��Դ]��");
    FormName.xxlybm.focus();
    return false;
  }
  if(!(isNumber(FormName.fwmj, "���ڽ������"))) {
    return false;
  }
  if(!(isDatetime(FormName.hfrq, "�ط�����"))) {
    return false;
  }


  if( !radioChecked(FormName.sfxhf)) {
    alert("��ѡ��[�Ƿ���ط�]��");
    FormName.sfxhf[0].focus();
    return false;
  }
  if (FormName.sfxhf[0].checked)
  {
    if( javaTrim(FormName.hfrq)=="") {
      alert("��ѡ��[�ط�����]��");
      FormName.hfrq.focus();
      return false;
    }
  }
  else{
    FormName.hfrq.value="";
  }

  if( javaTrim(FormName.khlxbm)=="") {
    alert("��ѡ��[��ϵ�ͻ�]��");
    FormName.khlxbm.focus();
    return false;
  }

  if( javaTrim(FormName.hdbz)=="") {
    alert("��ѡ��[�ص���־]��");
    FormName.hdbz.focus();
    return false;
  }


  if(FormName.hdbz.value=="1") {//1���ǻص��� 2�����ʦ�ص���3��ʩ���ӻص���4���Ͽͻ��ص�
    FormName.cgdz.value="";
    FormName.hdr.value="";

    FormName.cgdz.disabled=true;
    FormName.hdr.disabled=true;
  }
  else {
    if( javaTrim(FormName.cgdz)=="") {
      alert("������[�ص�װ�޵�ַ]��");
      FormName.cgdz.focus();
      return false;
    }
    if( javaTrim(FormName.hdr)=="") {
      alert("������[�ص���]��");
      FormName.hdr.focus();
      return false;
    }
  }

  if( javaTrim(FormName.yzxxbz)=="") {
    alert("������[��Ч��Ϣ��־]��");
    FormName.yzxxbz.focus();
    return false;
  }
   if(  !radioChecked(FormName.lfbz)) {
    alert("��ѡ��[������־]��");
    FormName.lfbz[0].focus();
    return false;
  }
  if (FormName.lfbz[1].checked)
  {
    if( javaTrim(FormName.lfsj)=="") {
      alert("������[����ʱ��]��");
      FormName.lfsj.focus();
      return false;
    }
    if(!(isDatetime(FormName.lfsj, "����ʱ��"))) {
      return false;
    }
  }
  else{
    FormName.lfsj.value="";
  }
  if( !radioChecked(FormName.jzbz)) {
    alert("��ѡ��[��װ��־]��");
    FormName.jzbz[0].focus();
    return false;
  }

  if(!(isDatetime(FormName.jhctsj, "�ƻ���ƽ��ͼʱ��"))) {
    return false;
  }
  if(!(isDatetime(FormName.jhcxgtsj, "�ƻ���Ч��ͼʱ��"))) {
    return false;
  }
  if(!(isDatetime(FormName.jhcsgtsj, "�ƻ���ʩ��ͼʱ��"))) {
    return false;
  }
  if(!(isDatetime(FormName.jhzbjsj, "�ƻ������ӱ���ʱ��"))) {
    return false;
  }
  if(!(isDatetime(FormName.yylfsj, "ԤԼ����ʱ��"))) {
    return false;
  }
  if(!(isDatetime(FormName.xclfsj, "�´�����ʱ��"))) {
    return false;
  }
  if( !radioChecked(FormName.sfyckh)) {
    alert("��ѡ��[�Ƿ�Զ�̿ͻ� ]��");
    FormName.sfyckh[0].focus();
    return false;
  }

  FormName.submit();
  FormName.savebutton.disabled=true;
  return true;
}
//-->
</SCRIPT>