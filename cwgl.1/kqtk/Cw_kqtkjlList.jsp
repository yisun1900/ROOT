<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String cw_kqtkjl_kkjlh=null;
	String cw_kqtkjl_sgd=null;
	String cw_kqtkjl_lrr=null;
	String cw_kqtkjl_lrsj=null;
	String cw_kqtkjl_lrbm=null;
	String cw_kqtkjl_jsbz=null;
	String cw_kqtkjl_jsjlh=null;

	String fgs=null;
	String khbh=null;
	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String sjs=null;
	String hth=null;
	String zjxm=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (cw_kqtkjl.khbh='"+khbh+"')";
	}
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm+"%')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs+"%')";
	}
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}



	String qtkkbm=null;
	qtkkbm=request.getParameter("qtkkbm");
	if (qtkkbm!=null)
	{
		if (!(qtkkbm.equals("")))	wheresql+=" and  (cw_kqtkjl.qtkkbm='"+qtkkbm+"')";
	}
	
	cw_kqtkjl_kkjlh=request.getParameter("cw_kqtkjl_kkjlh");
	if (cw_kqtkjl_kkjlh!=null)
	{
		cw_kqtkjl_kkjlh=cf.GB2Uni(cw_kqtkjl_kkjlh);
		if (!(cw_kqtkjl_kkjlh.equals("")))	wheresql+=" and  (cw_kqtkjl.kkjlh='"+cw_kqtkjl_kkjlh+"')";
	}
	cw_kqtkjl_sgd=request.getParameter("cw_kqtkjl_sgd");
	if (cw_kqtkjl_sgd!=null)
	{
		cw_kqtkjl_sgd=cf.GB2Uni(cw_kqtkjl_sgd);
		if (!(cw_kqtkjl_sgd.equals("")))	wheresql+=" and  (cw_kqtkjl.sgd='"+cw_kqtkjl_sgd+"')";
	}
	cw_kqtkjl_lrr=request.getParameter("cw_kqtkjl_lrr");
	if (cw_kqtkjl_lrr!=null)
	{
		cw_kqtkjl_lrr=cf.GB2Uni(cw_kqtkjl_lrr);
		if (!(cw_kqtkjl_lrr.equals("")))	wheresql+=" and  (cw_kqtkjl.lrr='"+cw_kqtkjl_lrr+"')";
	}
	cw_kqtkjl_lrsj=request.getParameter("cw_kqtkjl_lrsj");
	if (cw_kqtkjl_lrsj!=null)
	{
		cw_kqtkjl_lrsj=cw_kqtkjl_lrsj.trim();
		if (!(cw_kqtkjl_lrsj.equals("")))	wheresql+="  and (cw_kqtkjl.lrsj>=TO_DATE('"+cw_kqtkjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_kqtkjl_lrsj=request.getParameter("cw_kqtkjl_lrsj2");
	if (cw_kqtkjl_lrsj!=null)
	{
		cw_kqtkjl_lrsj=cw_kqtkjl_lrsj.trim();
		if (!(cw_kqtkjl_lrsj.equals("")))	wheresql+="  and (cw_kqtkjl.lrsj<=TO_DATE('"+cw_kqtkjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_kqtkjl_lrbm=request.getParameter("cw_kqtkjl_lrbm");
	if (cw_kqtkjl_lrbm!=null)
	{
		cw_kqtkjl_lrbm=cf.GB2Uni(cw_kqtkjl_lrbm);
		if (!(cw_kqtkjl_lrbm.equals("")))	wheresql+=" and  (cw_kqtkjl.lrbm='"+cw_kqtkjl_lrbm+"')";
	}
	cw_kqtkjl_jsbz=request.getParameter("cw_kqtkjl_jsbz");
	if (cw_kqtkjl_jsbz!=null)
	{
		cw_kqtkjl_jsbz=cf.GB2Uni(cw_kqtkjl_jsbz);
		if (!(cw_kqtkjl_jsbz.equals("")))	wheresql+=" and  (cw_kqtkjl.jsbz='"+cw_kqtkjl_jsbz+"')";
	}
	cw_kqtkjl_jsjlh=request.getParameter("cw_kqtkjl_jsjlh");
	if (cw_kqtkjl_jsjlh!=null)
	{
		cw_kqtkjl_jsjlh=cf.GB2Uni(cw_kqtkjl_jsjlh);
		if (!(cw_kqtkjl_jsjlh.equals("")))	wheresql+=" and  (cw_kqtkjl.jsjlh='"+cw_kqtkjl_jsjlh+"')";
	}
	ls_sql="SELECT cw_kqtkjl.kkjlh,crm_khxx.khxm,crm_khxx.hth,crm_khxx.fwdz,sq_sgd.sgdmc,qtkkmc,cw_kqtkjl.kkje,cw_kqtkjl.lrr,cw_kqtkjl.lrsj,sq_dwxx.dwmc, DECODE(cw_kqtkjl.jsbz,'N','δ����','Y','�ѽ���'),cw_kqtkjl.jsjlh,cw_kqtkjl.bz,cw_kqtkjl.khbh  ";
	ls_sql+=" FROM cw_kqtkjl,sq_dwxx,sq_sgd,dm_qtkkbm,crm_khxx  ";
    ls_sql+=" where cw_kqtkjl.sgd=sq_sgd.sgd and cw_kqtkjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=" and cw_kqtkjl.qtkkbm=dm_qtkkbm.qtkkbm(+) and cw_kqtkjl.khbh=crm_khxx.khbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_kqtkjl.kkjlh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_kqtkjlList.jsp","SelectCw_kqtkjl.jsp","","EditCw_kqtkjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"kkjlh","sq_sgd_sgdmc","cw_kqtkjl_kkje","cw_kqtkjl_lrr","cw_kqtkjl_lrsj","sq_dwxx_dwmc","cw_kqtkjl_jsbz","cw_kqtkjl_jsjlh","cw_kqtkjl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"kkjlh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Cw_kqtkjlList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] kkjlh = request.getParameterValues("kkjlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(kkjlh,"kkjlh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from cw_kqtkjl where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">�ۿ��¼��</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="4%">��ͬ��</td>
	<td  width="13%">���ݵ�ַ</td>
	<td  width="4%">ʩ����</td>
	<td  width="9%">�ۿ���Ŀ</td>
	<td  width="7%">�ۿ���</td>
	<td  width="4%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="9%">¼�벿��</td>
	<td  width="4%">�����־</td>
	<td  width="6%">�����¼��</td>
	<td  width="18%">��ע</td>
	<td  width="4%">�ͻ����</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>