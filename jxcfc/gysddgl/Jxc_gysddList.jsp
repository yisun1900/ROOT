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
	String jxc_gysdd_gysddph=null;
	String jxc_gysdd_ssfgs=null;
	String jxc_gysdd_dqbm=null;
	String jxc_gysdd_gysbm=null;
	String jxc_gysdd_gysmc=null;
	String jxc_gysdd_cglb=null;
	String jxc_gysdd_cllb=null;
	String jxc_gysdd_xdr=null;
	String jxc_gysdd_xdrq=null;
	String jxc_gysdd_psfs=null;
	String jxc_gysdd_yqdhsj=null;
	String jxc_gysdd_gysjsr=null;
	String jxc_gysdd_gysjsrq=null;
	String jxc_gysdd_fhsfwc=null;
	String jxc_gysdd_gysfhr=null;
	String jxc_gysdd_gysfhrq=null;
	String jxc_gysdd_sfjs=null;
	String jxc_gysdd_jsr=null;
	String jxc_gysdd_jsrq=null;
	String jxc_gysdd_sgph=null;
	String jxc_gysdd_ddzt=null;
	String jxc_gysdd_lrr=null;
	String jxc_gysdd_lrsj=null;
	String jxc_gysdd_lrbm=null;
	String jxc_gysdd_sfrksgdw=null;
	jxc_gysdd_gysddph=request.getParameter("jxc_gysdd_gysddph");
	if (jxc_gysdd_gysddph!=null)
	{
		jxc_gysdd_gysddph=cf.GB2Uni(jxc_gysdd_gysddph);
		if (!(jxc_gysdd_gysddph.equals("")))	wheresql+=" and  (jxc_gysdd.gysddph='"+jxc_gysdd_gysddph+"')";
	}
	jxc_gysdd_ssfgs=request.getParameter("jxc_gysdd_ssfgs");
	if (jxc_gysdd_ssfgs!=null)
	{
		jxc_gysdd_ssfgs=cf.GB2Uni(jxc_gysdd_ssfgs);
		if (!(jxc_gysdd_ssfgs.equals("")))	wheresql+=" and  (jxc_gysdd.ssfgs='"+jxc_gysdd_ssfgs+"')";
	}
	jxc_gysdd_dqbm=request.getParameter("jxc_gysdd_dqbm");
	if (jxc_gysdd_dqbm!=null)
	{
		jxc_gysdd_dqbm=cf.GB2Uni(jxc_gysdd_dqbm);
		if (!(jxc_gysdd_dqbm.equals("")))	wheresql+=" and  (jxc_gysdd.dqbm='"+jxc_gysdd_dqbm+"')";
	}
	jxc_gysdd_gysbm=request.getParameter("jxc_gysdd_gysbm");
	if (jxc_gysdd_gysbm!=null)
	{
		jxc_gysdd_gysbm=jxc_gysdd_gysbm.trim();
		if (!(jxc_gysdd_gysbm.equals("")))	wheresql+=" and (jxc_gysdd.gysbm="+jxc_gysdd_gysbm+") ";
	}
	jxc_gysdd_gysmc=request.getParameter("jxc_gysdd_gysmc");
	if (jxc_gysdd_gysmc!=null)
	{
		jxc_gysdd_gysmc=cf.GB2Uni(jxc_gysdd_gysmc);
		if (!(jxc_gysdd_gysmc.equals("")))	wheresql+=" and  (jxc_gysdd.gysmc='"+jxc_gysdd_gysmc+"')";
	}
	jxc_gysdd_cglb=request.getParameter("jxc_gysdd_cglb");
	if (jxc_gysdd_cglb!=null)
	{
		jxc_gysdd_cglb=cf.GB2Uni(jxc_gysdd_cglb);
		if (!(jxc_gysdd_cglb.equals("")))	wheresql+=" and  (jxc_gysdd.cglb='"+jxc_gysdd_cglb+"')";
	}
	jxc_gysdd_cllb=request.getParameter("jxc_gysdd_cllb");
	if (jxc_gysdd_cllb!=null)
	{
		jxc_gysdd_cllb=cf.GB2Uni(jxc_gysdd_cllb);
		if (!(jxc_gysdd_cllb.equals("")))	wheresql+=" and  (jxc_gysdd.cllb='"+jxc_gysdd_cllb+"')";
	}
	jxc_gysdd_xdr=request.getParameter("jxc_gysdd_xdr");
	if (jxc_gysdd_xdr!=null)
	{
		jxc_gysdd_xdr=cf.GB2Uni(jxc_gysdd_xdr);
		if (!(jxc_gysdd_xdr.equals("")))	wheresql+=" and  (jxc_gysdd.xdr='"+jxc_gysdd_xdr+"')";
	}
	jxc_gysdd_xdrq=request.getParameter("jxc_gysdd_xdrq");
	if (jxc_gysdd_xdrq!=null)
	{
		jxc_gysdd_xdrq=jxc_gysdd_xdrq.trim();
		if (!(jxc_gysdd_xdrq.equals("")))	wheresql+="  and (jxc_gysdd.xdrq>=TO_DATE('"+jxc_gysdd_xdrq+"','YYYY/MM/DD'))";
	}
	jxc_gysdd_xdrq=request.getParameter("jxc_gysdd_xdrq2");
	if (jxc_gysdd_xdrq!=null)
	{
		jxc_gysdd_xdrq=jxc_gysdd_xdrq.trim();
		if (!(jxc_gysdd_xdrq.equals("")))	wheresql+="  and (jxc_gysdd.xdrq<=TO_DATE('"+jxc_gysdd_xdrq+"','YYYY/MM/DD'))";
	}
	jxc_gysdd_psfs=request.getParameter("jxc_gysdd_psfs");
	if (jxc_gysdd_psfs!=null)
	{
		jxc_gysdd_psfs=cf.GB2Uni(jxc_gysdd_psfs);
		if (!(jxc_gysdd_psfs.equals("")))	wheresql+=" and  (jxc_gysdd.psfs='"+jxc_gysdd_psfs+"')";
	}
	jxc_gysdd_yqdhsj=request.getParameter("jxc_gysdd_yqdhsj");
	if (jxc_gysdd_yqdhsj!=null)
	{
		jxc_gysdd_yqdhsj=jxc_gysdd_yqdhsj.trim();
		if (!(jxc_gysdd_yqdhsj.equals("")))	wheresql+="  and (jxc_gysdd.yqdhsj>=TO_DATE('"+jxc_gysdd_yqdhsj+"','YYYY/MM/DD'))";
	}
	jxc_gysdd_yqdhsj=request.getParameter("jxc_gysdd_yqdhsj2");
	if (jxc_gysdd_yqdhsj!=null)
	{
		jxc_gysdd_yqdhsj=jxc_gysdd_yqdhsj.trim();
		if (!(jxc_gysdd_yqdhsj.equals("")))	wheresql+="  and (jxc_gysdd.yqdhsj<=TO_DATE('"+jxc_gysdd_yqdhsj+"','YYYY/MM/DD'))";
	}
	jxc_gysdd_gysjsr=request.getParameter("jxc_gysdd_gysjsr");
	if (jxc_gysdd_gysjsr!=null)
	{
		jxc_gysdd_gysjsr=cf.GB2Uni(jxc_gysdd_gysjsr);
		if (!(jxc_gysdd_gysjsr.equals("")))	wheresql+=" and  (jxc_gysdd.gysjsr='"+jxc_gysdd_gysjsr+"')";
	}
	jxc_gysdd_gysjsrq=request.getParameter("jxc_gysdd_gysjsrq");
	if (jxc_gysdd_gysjsrq!=null)
	{
		jxc_gysdd_gysjsrq=jxc_gysdd_gysjsrq.trim();
		if (!(jxc_gysdd_gysjsrq.equals("")))	wheresql+="  and (jxc_gysdd.gysjsrq>=TO_DATE('"+jxc_gysdd_gysjsrq+"','YYYY/MM/DD'))";
	}
	jxc_gysdd_gysjsrq=request.getParameter("jxc_gysdd_gysjsrq2");
	if (jxc_gysdd_gysjsrq!=null)
	{
		jxc_gysdd_gysjsrq=jxc_gysdd_gysjsrq.trim();
		if (!(jxc_gysdd_gysjsrq.equals("")))	wheresql+="  and (jxc_gysdd.gysjsrq<=TO_DATE('"+jxc_gysdd_gysjsrq+"','YYYY/MM/DD'))";
	}
	jxc_gysdd_fhsfwc=request.getParameter("jxc_gysdd_fhsfwc");
	if (jxc_gysdd_fhsfwc!=null)
	{
		jxc_gysdd_fhsfwc=cf.GB2Uni(jxc_gysdd_fhsfwc);
		if (!(jxc_gysdd_fhsfwc.equals("")))	wheresql+=" and  (jxc_gysdd.fhsfwc='"+jxc_gysdd_fhsfwc+"')";
	}
	jxc_gysdd_gysfhr=request.getParameter("jxc_gysdd_gysfhr");
	if (jxc_gysdd_gysfhr!=null)
	{
		jxc_gysdd_gysfhr=cf.GB2Uni(jxc_gysdd_gysfhr);
		if (!(jxc_gysdd_gysfhr.equals("")))	wheresql+=" and  (jxc_gysdd.gysfhr='"+jxc_gysdd_gysfhr+"')";
	}
	jxc_gysdd_gysfhrq=request.getParameter("jxc_gysdd_gysfhrq");
	if (jxc_gysdd_gysfhrq!=null)
	{
		jxc_gysdd_gysfhrq=jxc_gysdd_gysfhrq.trim();
		if (!(jxc_gysdd_gysfhrq.equals("")))	wheresql+="  and (jxc_gysdd.gysfhrq>=TO_DATE('"+jxc_gysdd_gysfhrq+"','YYYY/MM/DD'))";
	}
	jxc_gysdd_gysfhrq=request.getParameter("jxc_gysdd_gysfhrq2");
	if (jxc_gysdd_gysfhrq!=null)
	{
		jxc_gysdd_gysfhrq=jxc_gysdd_gysfhrq.trim();
		if (!(jxc_gysdd_gysfhrq.equals("")))	wheresql+="  and (jxc_gysdd.gysfhrq<=TO_DATE('"+jxc_gysdd_gysfhrq+"','YYYY/MM/DD'))";
	}
	jxc_gysdd_sfjs=request.getParameter("jxc_gysdd_sfjs");
	if (jxc_gysdd_sfjs!=null)
	{
		jxc_gysdd_sfjs=cf.GB2Uni(jxc_gysdd_sfjs);
		if (!(jxc_gysdd_sfjs.equals("")))	wheresql+=" and  (jxc_gysdd.sfjs='"+jxc_gysdd_sfjs+"')";
	}
	jxc_gysdd_jsr=request.getParameter("jxc_gysdd_jsr");
	if (jxc_gysdd_jsr!=null)
	{
		jxc_gysdd_jsr=cf.GB2Uni(jxc_gysdd_jsr);
		if (!(jxc_gysdd_jsr.equals("")))	wheresql+=" and  (jxc_gysdd.jsr='"+jxc_gysdd_jsr+"')";
	}
	jxc_gysdd_jsrq=request.getParameter("jxc_gysdd_jsrq");
	if (jxc_gysdd_jsrq!=null)
	{
		jxc_gysdd_jsrq=jxc_gysdd_jsrq.trim();
		if (!(jxc_gysdd_jsrq.equals("")))	wheresql+="  and (jxc_gysdd.jsrq>=TO_DATE('"+jxc_gysdd_jsrq+"','YYYY/MM/DD'))";
	}
	jxc_gysdd_jsrq=request.getParameter("jxc_gysdd_jsrq2");
	if (jxc_gysdd_jsrq!=null)
	{
		jxc_gysdd_jsrq=jxc_gysdd_jsrq.trim();
		if (!(jxc_gysdd_jsrq.equals("")))	wheresql+="  and (jxc_gysdd.jsrq<=TO_DATE('"+jxc_gysdd_jsrq+"','YYYY/MM/DD'))";
	}
	jxc_gysdd_sgph=request.getParameter("jxc_gysdd_sgph");
	if (jxc_gysdd_sgph!=null)
	{
		jxc_gysdd_sgph=cf.GB2Uni(jxc_gysdd_sgph);
		if (!(jxc_gysdd_sgph.equals("")))	wheresql+=" and  (jxc_gysdd.sgph='"+jxc_gysdd_sgph+"')";
	}
	jxc_gysdd_ddzt=request.getParameter("jxc_gysdd_ddzt");
	if (jxc_gysdd_ddzt!=null)
	{
		jxc_gysdd_ddzt=cf.GB2Uni(jxc_gysdd_ddzt);
		if (!(jxc_gysdd_ddzt.equals("")))	wheresql+=" and  (jxc_gysdd.ddzt='"+jxc_gysdd_ddzt+"')";
	}
	jxc_gysdd_lrr=request.getParameter("jxc_gysdd_lrr");
	if (jxc_gysdd_lrr!=null)
	{
		jxc_gysdd_lrr=cf.GB2Uni(jxc_gysdd_lrr);
		if (!(jxc_gysdd_lrr.equals("")))	wheresql+=" and  (jxc_gysdd.lrr='"+jxc_gysdd_lrr+"')";
	}
	jxc_gysdd_lrsj=request.getParameter("jxc_gysdd_lrsj");
	if (jxc_gysdd_lrsj!=null)
	{
		jxc_gysdd_lrsj=jxc_gysdd_lrsj.trim();
		if (!(jxc_gysdd_lrsj.equals("")))	wheresql+="  and (jxc_gysdd.lrsj>=TO_DATE('"+jxc_gysdd_lrsj+"','YYYY/MM/DD'))";
	}
	jxc_gysdd_lrsj=request.getParameter("jxc_gysdd_lrsj2");
	if (jxc_gysdd_lrsj!=null)
	{
		jxc_gysdd_lrsj=jxc_gysdd_lrsj.trim();
		if (!(jxc_gysdd_lrsj.equals("")))	wheresql+="  and (jxc_gysdd.lrsj<=TO_DATE('"+jxc_gysdd_lrsj+"','YYYY/MM/DD'))";
	}
	jxc_gysdd_lrbm=request.getParameter("jxc_gysdd_lrbm");
	if (jxc_gysdd_lrbm!=null)
	{
		jxc_gysdd_lrbm=cf.GB2Uni(jxc_gysdd_lrbm);
		if (!(jxc_gysdd_lrbm.equals("")))	wheresql+=" and  (jxc_gysdd.lrbm='"+jxc_gysdd_lrbm+"')";
	}
	jxc_gysdd_sfrksgdw=request.getParameter("jxc_gysdd_sfrksgdw");
	if (jxc_gysdd_sfrksgdw!=null)
	{
		jxc_gysdd_sfrksgdw=cf.GB2Uni(jxc_gysdd_sfrksgdw);
		if (!(jxc_gysdd_sfrksgdw.equals("")))	wheresql+=" and  (jxc_gysdd.sfrksgdw='"+jxc_gysdd_sfrksgdw+"')";
	}
	ls_sql="SELECT jxc_gysdd.gysddph, DECODE(jxc_gysdd.ddzt,'7','δ�ύ','0','�ȴ��µ�','1','���µ�','2','�ѽ���','3','���ַ���','5','����ɷ���','4','�����','6','���ڰ������','9','�ѽ���'), DECODE(jxc_gysdd.sfrksgdw,'Y','ֱ������깺��λ','N','��'),jxc_gysdd.sgph,a.dwmc xdfgs,dqmc,jxc_gysdd.gysbm,jxc_gysdd.gysmc, DECODE(jxc_gysdd.cglb,'J','���Ųɹ�','D','�ط��ɹ�'), DECODE(jxc_gysdd.cllb,'0','����','1','����'),jxc_gysdd.dhzsl,jxc_gysdd.dhzje,jxc_gysdd.xdr,jxc_gysdd.xdrq, DECODE(jxc_gysdd.psfs,'1','����','2','��ȡ','3','����'),jxc_gysdd.yqdhsj,jxc_gysdd.gysjsr,jxc_gysdd.gysjsrq, DECODE(jxc_gysdd.fhsfwc,'N','δ����','Y','�����','M','���ַ���'),jxc_gysdd.gysfhr,jxc_gysdd.gysfhrq, DECODE(jxc_gysdd.sfjs,'Y','�ѽ���','N','δ����'),jxc_gysdd.jsr,jxc_gysdd.jsrq,jxc_gysdd.lrr,jxc_gysdd.lrsj,b.dwmc lrbm,jxc_gysdd.nian,jxc_gysdd.bz  ";
	ls_sql+=" FROM jxc_gysdd,sq_dwxx a,sq_dwxx b,dm_dqbm  ";
    ls_sql+=" where jxc_gysdd.ssfgs=a.dwbh and jxc_gysdd.lrbm=b.dwbh and jxc_gysdd.dqbm=dm_dqbm.dqbm";
    ls_sql+=" and jxc_gysdd.cllb='1'";//0�����ģ�1������
    ls_sql+=wheresql;
    ls_sql+=" order by lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_gysddList.jsp","","","EditJxc_gysdd.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"gysddph","sq_dwxx_dwmc","jxc_gysdd_dqbm","jxc_gysdd_gysbm","jxc_gysdd_gysmc","jxc_gysdd_cglb","jxc_gysdd_cllb","jxc_gysdd_dhzsl","jxc_gysdd_dhzje","jxc_gysdd_xdr","jxc_gysdd_xdrq","jxc_gysdd_psfs","jxc_gysdd_yqdhsj","jxc_gysdd_gysjsr","jxc_gysdd_gysjsrq","jxc_gysdd_fhsfwc","jxc_gysdd_gysfhr","jxc_gysdd_gysfhrq","jxc_gysdd_sfjs","jxc_gysdd_jsr","jxc_gysdd_jsrq","jxc_gysdd_sgph","jxc_gysdd_ddzt","jxc_gysdd_lrr","jxc_gysdd_lrsj","jxc_gysdd_lrbm","jxc_gysdd_nian","jxc_gysdd_bz","jxc_gysdd_sfrksgdw"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"gysddph"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jxc_gysddList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"gysddph"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/jxcfc/gysddgl/ViewJxc_gysdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("gysddph",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] gysddph = request.getParameterValues("gysddph");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(gysddph,"gysddph"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jxc_gysdd where "+chooseitem;
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
  <B><font size="3">�޸Ķ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(320);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="4%">��Ӧ�̶�������</td>
	<td  width="3%">����״̬</td>
	<td  width="3%">ֱ������깺��λ</td>
	<td  width="4%">�깺����</td>
	<td  width="4%">�µ���˾</td>
	<td  width="2%">����</td>
	<td  width="3%">��Ӧ�̱���</td>
	<td  width="8%">��Ӧ������</td>
	<td  width="3%">�ɹ����</td>
	<td  width="3%">�������</td>
	<td  width="4%">����������</td>
	<td  width="4%">�����ܽ��</td>
	<td  width="2%">�µ���</td>
	<td  width="3%">�µ�����</td>
	<td  width="2%">���ͷ�ʽ</td>
	<td  width="3%">Ҫ�󵽻�ʱ��</td>
	<td  width="2%">��Ӧ�̽�����</td>
	<td  width="3%">��Ӧ�̽�������</td>
	<td  width="2%">�Ƿ񷢻�</td>
	<td  width="2%">��Ӧ�̷�����</td>
	<td  width="3%">��Ӧ�̷�������</td>
	<td  width="3%">�Ƿ����</td>
	<td  width="2%">������</td>
	<td  width="3%">��������</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="4%">¼�벿��</td>
	<td  width="2%">��</td>
	<td  width="11%">��ע</td>
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