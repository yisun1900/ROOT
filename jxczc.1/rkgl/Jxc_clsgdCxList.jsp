<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String jxc_clsgd_sgph=null;
	String jxc_clsgd_sglb=null;
	String jxc_clsgd_ssfgs=null;
	String sq_dwxx_dwmc=null;
	String jxc_clsgd_sgr=null;
	String jxc_clsgd_sgrq=null;
	String jxc_clsgd_sgzsl=null;
	String jxc_clsgd_sgzje=null;
	String jxc_clsgd_psfs=null;
	String jxc_clsgd_jhshsj=null;
	String jxc_clsgd_shr=null;
	String jxc_clsgd_shrq=null;
	String jxc_clsgd_sfsk=null;
	String jxc_clsgd_skqrr=null;
	String jxc_clsgd_skqrsj=null;
	String jxc_clsgd_sfzcgd=null;
	String jxc_clsgd_ckph=null;
	String jxc_clsgd_rkph=null;
	String jxc_clsgd_sgdzt=null;
	String jxc_clsgd_lrr=null;
	String jxc_clsgd_lrsj=null;
	jxc_clsgd_sgph=request.getParameter("jxc_clsgd_sgph");
	if (jxc_clsgd_sgph!=null)
	{
		jxc_clsgd_sgph=cf.GB2Uni(jxc_clsgd_sgph);
		if (!(jxc_clsgd_sgph.equals("")))	wheresql+=" and  (jxc_clsgd.sgph='"+jxc_clsgd_sgph+"')";
	}
	jxc_clsgd_sglb=request.getParameter("jxc_clsgd_sglb");
	if (jxc_clsgd_sglb!=null)
	{
		jxc_clsgd_sglb=cf.GB2Uni(jxc_clsgd_sglb);
		if (!(jxc_clsgd_sglb.equals("")))	wheresql+=" and  (jxc_clsgd.sglb='"+jxc_clsgd_sglb+"')";
	}
	jxc_clsgd_ssfgs=request.getParameter("jxc_clsgd_ssfgs");
	if (jxc_clsgd_ssfgs!=null)
	{
		jxc_clsgd_ssfgs=cf.GB2Uni(jxc_clsgd_ssfgs);
		if (!(jxc_clsgd_ssfgs.equals("")))	wheresql+=" and  (jxc_clsgd.ssfgs='"+jxc_clsgd_ssfgs+"')";
	}
	sq_dwxx_dwmc=request.getParameter("sq_dwxx_dwmc");
	if (sq_dwxx_dwmc!=null)
	{
		sq_dwxx_dwmc=cf.GB2Uni(sq_dwxx_dwmc);
		if (!(sq_dwxx_dwmc.equals("")))	wheresql+=" and  (sq_dwxx.dwmc='"+sq_dwxx_dwmc+"')";
	}
	jxc_clsgd_sgr=request.getParameter("jxc_clsgd_sgr");
	if (jxc_clsgd_sgr!=null)
	{
		jxc_clsgd_sgr=cf.GB2Uni(jxc_clsgd_sgr);
		if (!(jxc_clsgd_sgr.equals("")))	wheresql+=" and  (jxc_clsgd.sgr='"+jxc_clsgd_sgr+"')";
	}
	jxc_clsgd_sgrq=request.getParameter("jxc_clsgd_sgrq");
	if (jxc_clsgd_sgrq!=null)
	{
		jxc_clsgd_sgrq=jxc_clsgd_sgrq.trim();
		if (!(jxc_clsgd_sgrq.equals("")))	wheresql+="  and (jxc_clsgd.sgrq>=TO_DATE('"+jxc_clsgd_sgrq+"','YYYY/MM/DD'))";
	}
	jxc_clsgd_sgrq=request.getParameter("jxc_clsgd_sgrq2");
	if (jxc_clsgd_sgrq!=null)
	{
		jxc_clsgd_sgrq=jxc_clsgd_sgrq.trim();
		if (!(jxc_clsgd_sgrq.equals("")))	wheresql+="  and (jxc_clsgd.sgrq<=TO_DATE('"+jxc_clsgd_sgrq+"','YYYY/MM/DD'))";
	}
	jxc_clsgd_sgzsl=request.getParameter("jxc_clsgd_sgzsl");
	if (jxc_clsgd_sgzsl!=null)
	{
		jxc_clsgd_sgzsl=jxc_clsgd_sgzsl.trim();
		if (!(jxc_clsgd_sgzsl.equals("")))	wheresql+=" and  (jxc_clsgd.sgzsl="+jxc_clsgd_sgzsl+") ";
	}
	jxc_clsgd_sgzje=request.getParameter("jxc_clsgd_sgzje");
	if (jxc_clsgd_sgzje!=null)
	{
		jxc_clsgd_sgzje=jxc_clsgd_sgzje.trim();
		if (!(jxc_clsgd_sgzje.equals("")))	wheresql+=" and  (jxc_clsgd.sgzje="+jxc_clsgd_sgzje+") ";
	}
	jxc_clsgd_psfs=request.getParameter("jxc_clsgd_psfs");
	if (jxc_clsgd_psfs!=null)
	{
		jxc_clsgd_psfs=cf.GB2Uni(jxc_clsgd_psfs);
		if (!(jxc_clsgd_psfs.equals("")))	wheresql+=" and  (jxc_clsgd.psfs='"+jxc_clsgd_psfs+"')";
	}
	jxc_clsgd_jhshsj=request.getParameter("jxc_clsgd_jhshsj");
	if (jxc_clsgd_jhshsj!=null)
	{
		jxc_clsgd_jhshsj=jxc_clsgd_jhshsj.trim();
		if (!(jxc_clsgd_jhshsj.equals("")))	wheresql+="  and (jxc_clsgd.jhshsj>=TO_DATE('"+jxc_clsgd_jhshsj+"','YYYY/MM/DD'))";
	}
	jxc_clsgd_jhshsj=request.getParameter("jxc_clsgd_jhshsj2");
	if (jxc_clsgd_jhshsj!=null)
	{
		jxc_clsgd_jhshsj=jxc_clsgd_jhshsj.trim();
		if (!(jxc_clsgd_jhshsj.equals("")))	wheresql+="  and (jxc_clsgd.jhshsj<=TO_DATE('"+jxc_clsgd_jhshsj+"','YYYY/MM/DD'))";
	}
	jxc_clsgd_shr=request.getParameter("jxc_clsgd_shr");
	if (jxc_clsgd_shr!=null)
	{
		jxc_clsgd_shr=cf.GB2Uni(jxc_clsgd_shr);
		if (!(jxc_clsgd_shr.equals("")))	wheresql+=" and  (jxc_clsgd.shr='"+jxc_clsgd_shr+"')";
	}
	jxc_clsgd_shrq=request.getParameter("jxc_clsgd_shrq");
	if (jxc_clsgd_shrq!=null)
	{
		jxc_clsgd_shrq=jxc_clsgd_shrq.trim();
		if (!(jxc_clsgd_shrq.equals("")))	wheresql+="  and (jxc_clsgd.shrq>=TO_DATE('"+jxc_clsgd_shrq+"','YYYY/MM/DD'))";
	}
	jxc_clsgd_shrq=request.getParameter("jxc_clsgd_shrq2");
	if (jxc_clsgd_shrq!=null)
	{
		jxc_clsgd_shrq=jxc_clsgd_shrq.trim();
		if (!(jxc_clsgd_shrq.equals("")))	wheresql+="  and (jxc_clsgd.shrq<=TO_DATE('"+jxc_clsgd_shrq+"','YYYY/MM/DD'))";
	}
	jxc_clsgd_sfsk=request.getParameter("jxc_clsgd_sfsk");
	if (jxc_clsgd_sfsk!=null)
	{
		jxc_clsgd_sfsk=cf.GB2Uni(jxc_clsgd_sfsk);
		if (!(jxc_clsgd_sfsk.equals("")))	wheresql+=" and  (jxc_clsgd.sfsk='"+jxc_clsgd_sfsk+"')";
	}
	jxc_clsgd_skqrr=request.getParameter("jxc_clsgd_skqrr");
	if (jxc_clsgd_skqrr!=null)
	{
		jxc_clsgd_skqrr=cf.GB2Uni(jxc_clsgd_skqrr);
		if (!(jxc_clsgd_skqrr.equals("")))	wheresql+=" and  (jxc_clsgd.skqrr='"+jxc_clsgd_skqrr+"')";
	}
	jxc_clsgd_skqrsj=request.getParameter("jxc_clsgd_skqrsj");
	if (jxc_clsgd_skqrsj!=null)
	{
		jxc_clsgd_skqrsj=jxc_clsgd_skqrsj.trim();
		if (!(jxc_clsgd_skqrsj.equals("")))	wheresql+="  and (jxc_clsgd.skqrsj>=TO_DATE('"+jxc_clsgd_skqrsj+"','YYYY/MM/DD'))";
	}
	jxc_clsgd_skqrsj=request.getParameter("jxc_clsgd_skqrsj2");
	if (jxc_clsgd_skqrsj!=null)
	{
		jxc_clsgd_skqrsj=jxc_clsgd_skqrsj.trim();
		if (!(jxc_clsgd_skqrsj.equals("")))	wheresql+="  and (jxc_clsgd.skqrsj<=TO_DATE('"+jxc_clsgd_skqrsj+"','YYYY/MM/DD'))";
	}
	jxc_clsgd_sfzcgd=request.getParameter("jxc_clsgd_sfzcgd");
	if (jxc_clsgd_sfzcgd!=null)
	{
		jxc_clsgd_sfzcgd=cf.GB2Uni(jxc_clsgd_sfzcgd);
		if (!(jxc_clsgd_sfzcgd.equals("")))	wheresql+=" and  (jxc_clsgd.sfzcgd='"+jxc_clsgd_sfzcgd+"')";
	}
	jxc_clsgd_ckph=request.getParameter("jxc_clsgd_ckph");
	if (jxc_clsgd_ckph!=null)
	{
		jxc_clsgd_ckph=cf.GB2Uni(jxc_clsgd_ckph);
		if (!(jxc_clsgd_ckph.equals("")))	wheresql+=" and  (jxc_clsgd.ckph='"+jxc_clsgd_ckph+"')";
	}
	jxc_clsgd_rkph=request.getParameter("jxc_clsgd_rkph");
	if (jxc_clsgd_rkph!=null)
	{
		jxc_clsgd_rkph=cf.GB2Uni(jxc_clsgd_rkph);
		if (!(jxc_clsgd_rkph.equals("")))	wheresql+=" and  (jxc_clsgd.rkph='"+jxc_clsgd_rkph+"')";
	}
	jxc_clsgd_sgdzt=request.getParameter("jxc_clsgd_sgdzt");
	if (jxc_clsgd_sgdzt!=null)
	{
		jxc_clsgd_sgdzt=cf.GB2Uni(jxc_clsgd_sgdzt);
		if (!(jxc_clsgd_sgdzt.equals("")))	wheresql+=" and  (jxc_clsgd.sgdzt='"+jxc_clsgd_sgdzt+"')";
	}
	jxc_clsgd_lrr=request.getParameter("jxc_clsgd_lrr");
	if (jxc_clsgd_lrr!=null)
	{
		jxc_clsgd_lrr=cf.GB2Uni(jxc_clsgd_lrr);
		if (!(jxc_clsgd_lrr.equals("")))	wheresql+=" and  (jxc_clsgd.lrr='"+jxc_clsgd_lrr+"')";
	}
	jxc_clsgd_lrsj=request.getParameter("jxc_clsgd_lrsj");
	if (jxc_clsgd_lrsj!=null)
	{
		jxc_clsgd_lrsj=jxc_clsgd_lrsj.trim();
		if (!(jxc_clsgd_lrsj.equals("")))	wheresql+="  and (jxc_clsgd.lrsj>=TO_DATE('"+jxc_clsgd_lrsj+"','YYYY/MM/DD'))";
	}
	jxc_clsgd_lrsj=request.getParameter("jxc_clsgd_lrsj2");
	if (jxc_clsgd_lrsj!=null)
	{
		jxc_clsgd_lrsj=jxc_clsgd_lrsj.trim();
		if (!(jxc_clsgd_lrsj.equals("")))	wheresql+="  and (jxc_clsgd.lrsj<=TO_DATE('"+jxc_clsgd_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT jxc_gysdd.gysddph,jxc_gysdd.gysmc,jxc_gysdd.xdrq,jxc_clsgd.sgph, DECODE(jxc_clsgd.sgdzt,'0','δ�ύ','1','���ύ','2','���ͨ��','5','���ֳ���','3','�ѳ���','4','�����','6','���δͨ��'),a.dwmc fgs,jxc_clsgd.sgrq,DECODE(jxc_gysdd.sfrksgdw,'Y','ֱ������깺��˾','N','��'),jxc_clsgd.sgzsl,jxc_clsgd.sgzje,DECODE(jxc_clsgd.sglb,'0','����','1','����'),jxc_clsgd.sgr, DECODE(jxc_clsgd.psfs,'1','����','2','��ȡ','9','����'),jxc_clsgd.jhshsj,jxc_clsgd.shr,jxc_clsgd.shrq, DECODE(jxc_clsgd.sfzcgd,'Y','תΪ�ɹ��ƻ�','N','δת','M','תΪ��Ӧ�̶���'),jxc_clsgd.lrr,jxc_clsgd.lrsj,jxc_clsgd.bz  ";
	ls_sql+=" FROM jxc_clsgd,sq_dwxx a,jxc_gysdd  ";
    ls_sql+=" where jxc_clsgd.ssfgs=a.dwbh  ";
    ls_sql+=" and jxc_clsgd.sgph=jxc_gysdd.sgph";
    ls_sql+=" and jxc_gysdd.ddzt='1'";//7��δ�ύ��0�����ύ��1�����µ���2���ѽ��ܣ�3�����ַ�����5������ɷ�����4������⣻6�����ڰ�����⣻ 9���ѽ���
    ls_sql+=" and jxc_gysdd.sfrksgdw='Y' ";//�Ƿ�ֱ������깺��˾
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and jxc_clsgd.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and jxc_clsgd.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_clsgd.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_clsgdCxList.jsp","","","InsertJxc_rkdSgd.jsp?rklx=S");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"gysddph","sgph"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("���");



//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"sgph"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/jxcfc/sgdgl/ViewJxc_clsgd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("sgph",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"gysddph"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/jxcfc/gysddgl/ViewJxc_gysdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("gysddph",coluParm);//�в����������Hash��
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
  <B><font size="3">�깺����ֱ������깺��˾</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(260);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="5%">��Ӧ�̶�����</td>
	<td  width="9%">��Ӧ������</td>
	<td  width="4%">�µ�����</td>
	<td  width="5%">�깺����</td>
	<td  width="4%">�깺��״̬</td>
	<td  width="5%">�깺��˾</td>
	<td  width="4%">�깺����</td>
	<td  width="6%">�Ƿ�����깺��˾</td>
	<td  width="4%">�깺������</td>
	<td  width="4%">�깺�ܽ��</td>
	<td  width="3%">�깺���</td>
	<td  width="3%">�깺��</td>
	<td  width="3%">���ͷ�ʽ</td>
	<td  width="4%">�ƻ��ͻ�ʱ��</td>
	<td  width="3%">�����</td>
	<td  width="4%">�������</td>
	<td  width="5%">�Ƿ�תΪ����</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="16%">��ע</td>
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