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
	String jxc_fcxsd_xsph=null;
	String jxc_fcxsd_dqbm=null;
	String jxc_fcxsd_ssfgs=null;
	String jxc_fcxsd_xsdlx=null;
	String jxc_fcxsd_sklx=null;
	String jxc_fcxsd_sfqk=null;
	String jxc_fcxsd_shfmc=null;
	String jxc_fcxsd_shrlxfs=null;
	String jxc_fcxsd_shfdz=null;
	String jxc_fcxsd_xsy=null;
	String jxc_fcxsd_xsrq=null;
	String jxc_fcxsd_xsdzt=null;
	String jxc_fcxsd_lrr=null;
	String jxc_fcxsd_lrsj=null;
	String jxc_fcxsd_lrbm=null;
	jxc_fcxsd_xsph=request.getParameter("jxc_fcxsd_xsph");
	if (jxc_fcxsd_xsph!=null)
	{
		jxc_fcxsd_xsph=cf.GB2Uni(jxc_fcxsd_xsph);
		if (!(jxc_fcxsd_xsph.equals("")))	wheresql+=" and  (jxc_fcxsd.xsph='"+jxc_fcxsd_xsph+"')";
	}
	jxc_fcxsd_dqbm=request.getParameter("jxc_fcxsd_dqbm");
	if (jxc_fcxsd_dqbm!=null)
	{
		jxc_fcxsd_dqbm=cf.GB2Uni(jxc_fcxsd_dqbm);
		if (!(jxc_fcxsd_dqbm.equals("")))	wheresql+=" and  (jxc_fcxsd.dqbm='"+jxc_fcxsd_dqbm+"')";
	}
	jxc_fcxsd_ssfgs=request.getParameter("jxc_fcxsd_ssfgs");
	if (jxc_fcxsd_ssfgs!=null)
	{
		jxc_fcxsd_ssfgs=cf.GB2Uni(jxc_fcxsd_ssfgs);
		if (!(jxc_fcxsd_ssfgs.equals("")))	wheresql+=" and  (jxc_fcxsd.ssfgs='"+jxc_fcxsd_ssfgs+"')";
	}
	jxc_fcxsd_xsdlx=request.getParameter("jxc_fcxsd_xsdlx");
	if (jxc_fcxsd_xsdlx!=null)
	{
		jxc_fcxsd_xsdlx=cf.GB2Uni(jxc_fcxsd_xsdlx);
		if (!(jxc_fcxsd_xsdlx.equals("")))	wheresql+=" and  (jxc_fcxsd.xsdlx='"+jxc_fcxsd_xsdlx+"')";
	}
	jxc_fcxsd_sklx=request.getParameter("jxc_fcxsd_sklx");
	if (jxc_fcxsd_sklx!=null)
	{
		jxc_fcxsd_sklx=cf.GB2Uni(jxc_fcxsd_sklx);
		if (!(jxc_fcxsd_sklx.equals("")))	wheresql+=" and  (jxc_fcxsd.sklx='"+jxc_fcxsd_sklx+"')";
	}
	jxc_fcxsd_sfqk=request.getParameter("jxc_fcxsd_sfqk");
	if (jxc_fcxsd_sfqk!=null)
	{
		jxc_fcxsd_sfqk=cf.GB2Uni(jxc_fcxsd_sfqk);
		if (!(jxc_fcxsd_sfqk.equals("")))	wheresql+=" and  (jxc_fcxsd.sfqk='"+jxc_fcxsd_sfqk+"')";
	}
	jxc_fcxsd_shfmc=request.getParameter("jxc_fcxsd_shfmc");
	if (jxc_fcxsd_shfmc!=null)
	{
		jxc_fcxsd_shfmc=cf.GB2Uni(jxc_fcxsd_shfmc);
		if (!(jxc_fcxsd_shfmc.equals("")))	wheresql+=" and  (jxc_fcxsd.shfmc='"+jxc_fcxsd_shfmc+"')";
	}
	jxc_fcxsd_shrlxfs=request.getParameter("jxc_fcxsd_shrlxfs");
	if (jxc_fcxsd_shrlxfs!=null)
	{
		jxc_fcxsd_shrlxfs=cf.GB2Uni(jxc_fcxsd_shrlxfs);
		if (!(jxc_fcxsd_shrlxfs.equals("")))	wheresql+=" and  (jxc_fcxsd.shrlxfs='"+jxc_fcxsd_shrlxfs+"')";
	}
	jxc_fcxsd_shfdz=request.getParameter("jxc_fcxsd_shfdz");
	if (jxc_fcxsd_shfdz!=null)
	{
		jxc_fcxsd_shfdz=cf.GB2Uni(jxc_fcxsd_shfdz);
		if (!(jxc_fcxsd_shfdz.equals("")))	wheresql+=" and  (jxc_fcxsd.shfdz='"+jxc_fcxsd_shfdz+"')";
	}
	jxc_fcxsd_xsy=request.getParameter("jxc_fcxsd_xsy");
	if (jxc_fcxsd_xsy!=null)
	{
		jxc_fcxsd_xsy=cf.GB2Uni(jxc_fcxsd_xsy);
		if (!(jxc_fcxsd_xsy.equals("")))	wheresql+=" and  (jxc_fcxsd.xsy='"+jxc_fcxsd_xsy+"')";
	}
	jxc_fcxsd_xsrq=request.getParameter("jxc_fcxsd_xsrq");
	if (jxc_fcxsd_xsrq!=null)
	{
		jxc_fcxsd_xsrq=jxc_fcxsd_xsrq.trim();
		if (!(jxc_fcxsd_xsrq.equals("")))	wheresql+="  and (jxc_fcxsd.xsrq>=TO_DATE('"+jxc_fcxsd_xsrq+"','YYYY/MM/DD'))";
	}
	jxc_fcxsd_xsrq=request.getParameter("jxc_fcxsd_xsrq2");
	if (jxc_fcxsd_xsrq!=null)
	{
		jxc_fcxsd_xsrq=jxc_fcxsd_xsrq.trim();
		if (!(jxc_fcxsd_xsrq.equals("")))	wheresql+="  and (jxc_fcxsd.xsrq<=TO_DATE('"+jxc_fcxsd_xsrq+"','YYYY/MM/DD'))";
	}
	jxc_fcxsd_xsdzt=request.getParameter("jxc_fcxsd_xsdzt");
	if (jxc_fcxsd_xsdzt!=null)
	{
		jxc_fcxsd_xsdzt=cf.GB2Uni(jxc_fcxsd_xsdzt);
		if (!(jxc_fcxsd_xsdzt.equals("")))	wheresql+=" and  (jxc_fcxsd.xsdzt='"+jxc_fcxsd_xsdzt+"')";
	}
	jxc_fcxsd_lrr=request.getParameter("jxc_fcxsd_lrr");
	if (jxc_fcxsd_lrr!=null)
	{
		jxc_fcxsd_lrr=cf.GB2Uni(jxc_fcxsd_lrr);
		if (!(jxc_fcxsd_lrr.equals("")))	wheresql+=" and  (jxc_fcxsd.lrr='"+jxc_fcxsd_lrr+"')";
	}
	jxc_fcxsd_lrsj=request.getParameter("jxc_fcxsd_lrsj");
	if (jxc_fcxsd_lrsj!=null)
	{
		jxc_fcxsd_lrsj=jxc_fcxsd_lrsj.trim();
		if (!(jxc_fcxsd_lrsj.equals("")))	wheresql+="  and (jxc_fcxsd.lrsj>=TO_DATE('"+jxc_fcxsd_lrsj+"','YYYY/MM/DD'))";
	}
	jxc_fcxsd_lrsj=request.getParameter("jxc_fcxsd_lrsj2");
	if (jxc_fcxsd_lrsj!=null)
	{
		jxc_fcxsd_lrsj=jxc_fcxsd_lrsj.trim();
		if (!(jxc_fcxsd_lrsj.equals("")))	wheresql+="  and (jxc_fcxsd.lrsj<=TO_DATE('"+jxc_fcxsd_lrsj+"','YYYY/MM/DD'))";
	}
	jxc_fcxsd_lrbm=request.getParameter("jxc_fcxsd_lrbm");
	if (jxc_fcxsd_lrbm!=null)
	{
		jxc_fcxsd_lrbm=cf.GB2Uni(jxc_fcxsd_lrbm);
		if (!(jxc_fcxsd_lrbm.equals("")))	wheresql+=" and  (jxc_fcxsd.lrbm='"+jxc_fcxsd_lrbm+"')";
	}

	ls_sql="SELECT jxc_fcxsd.xsph, DECODE(jxc_fcxsd.xsdzt,'0','δ�ύ','1','�ȴ����','2','�ȴ�����','3','�ѳ���','4','���ֳ���','9','ȡ��'),dqmc,a.dwmc ssfgs,xsdlxmc,jxc_fcxsd.xszsl,jxc_fcxsd.xszje,jxc_fcxsd.cbzje, DECODE(jxc_fcxsd.sklx,'1','�ֽ�','2','ת��','3','֧Ʊ','9','����'), DECODE(jxc_fcxsd.sfqk,'1','ȫ��','2','���ֿ�','3','δ����'),jxc_fcxsd.shfmc,jxc_fcxsd.shrlxfs,jxc_fcxsd.shfdz,jxc_fcxsd.xsy,jxc_fcxsd.xsrq,jxc_fcxsd.lrr,jxc_fcxsd.lrsj,b.dwmc lrbm,jxc_fcxsd.bz  ";
	ls_sql+=" FROM jxc_fcxsd,sq_dwxx a,sq_dwxx b,dm_dqbm,dm_xsdlx  ";
    ls_sql+=" where jxc_fcxsd.ssfgs=a.dwbh(+) and jxc_fcxsd.lrbm=b.dwbh(+) and jxc_fcxsd.dqbm=dm_dqbm.dqbm ";
    ls_sql+=" and jxc_fcxsd.xsdlx=dm_xsdlx.xsdlx(+)";
    ls_sql+=" and jxc_fcxsd.cllx='1'";//0�����ģ�1������
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_fcxsd.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_fcxsdCxList.jsp","","/jxcdy/dyxsd.jsp","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xsph","jxc_fcxsd_dqbm","sq_dwxx_dwmc","jxc_fcxsd_ckbh","jxc_fcxsd_xsdlx","jxc_fcxsd_xszsl","jxc_fcxsd_xszje","jxc_fcxsd_sklx","jxc_fcxsd_sfqk","jxc_fcxsd_shfmc","jxc_fcxsd_shrlxfs","jxc_fcxsd_shfdz","jxc_fcxsd_xsy","jxc_fcxsd_xsrq","jxc_fcxsd_xsdzt","jxc_fcxsd_nian","jxc_fcxsd_lrr","jxc_fcxsd_lrsj","jxc_fcxsd_lrbm","jxc_fcxsd_bz","jxc_fcxsd_cbzje"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xsph"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("��ӡ");
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"xsph"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewJxc_fcxsd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("xsph",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���۵�����ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(270);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="4%">��������</td>
	<td  width="3%">���۵�״̬</td>
	<td  width="3%">����</td>
	<td  width="4%">�����ֹ�˾</td>
	<td  width="3%">���۵�����</td>
	<td  width="4%">����������</td>
	<td  width="4%">�����ܽ��</td>
	<td  width="4%">�ɱ��ܽ��</td>
	<td  width="3%">�տ�����</td>
	<td  width="3%">�Ƿ�ȫ��</td>
	<td  width="7%">�ջ�������</td>
	<td  width="7%">�ջ�����ϵ��ʽ</td>
	<td  width="10%">�ջ�����ַ</td>
	<td  width="3%">����Ա</td>
	<td  width="4%">��������</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="5%">¼�벿��</td>
	<td  width="22%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
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